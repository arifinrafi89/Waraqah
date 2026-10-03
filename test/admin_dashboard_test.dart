import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/data/sources/dashboard_fake_api.dart';
import 'package:waraqah/features/admin/data/sources/search_log.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('live search counts the finished term, not each keystroke', () {
    final log = SearchLog();
    for (final typed in ['ma', 'mat', 'mati', 'matilda']) {
      log.record(typed);
    }
    // The same term again is the same search; a later one counts.
    log.record('Matilda');
    log.record('tafsir');
    log.record('Matilda');
    final top = {for (final t in log.top(10)) t['term']: t['count']};
    expect(top['matilda'], 2);
    expect(top.containsKey('mat'), isFalse);
    expect(top.containsKey('mati'), isFalse);
  });

  test('the dashboard counts searches, queues and requests', () async {
    final backend = FakeBackend();
    for (final q in ['zero to one', 'zero to one']) {
      await backend.dio.get<Object?>(
        BookFakeApi.books,
        queryParameters: {'q': q},
      );
    }
    final data = (await backend.dio.get<Map<String, dynamic>>(
      DashboardFakeApi.dashboard,
    )).data!;
    expect(data['listingsWaiting'], greaterThan(0));
    expect(data['openDisputes'], greaterThan(0));
    final searches = {
      for (final s in data['topSearches'] as List) s['term']: s['count'],
    };
    expect(searches['sapiens'], 14);
    expect((data['topRequested'] as List).first['title'], isNotEmpty);
    // A new order counts for today.
    expect(data['ordersToday'], isA<int>());
  });

  testWidgets('Staff see the day and open the queue from it', (tester) async {
    final router = await openApp(
      tester,
      AdminRoutes.section(AdminSection.dashboard),
      role: 'superAdmin',
    );
    expect(find.text('Top searches'), findsOneWidget);
    expect(find.text('sapiens'), findsOneWidget);
    await tester.tap(find.text('Listings to approve'));
    await settle(tester);
    expect(pathOf(router), AdminRoutes.section(AdminSection.moderation));
  });

  testWidgets('support Staff see numbers they cannot open', (tester) async {
    final router = await openApp(
      tester,
      AdminRoutes.section(AdminSection.dashboard),
      role: 'support',
    );
    await tester.tap(find.text('Open reports'));
    await settle(tester);
    expect(pathOf(router), AdminRoutes.section(AdminSection.dashboard));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/orders/data/sources/order_fake_store.dart';
import 'package:waraqah/features/shelves/data/sources/shelf_fake_store.dart';
import 'package:waraqah/features/shelves/domain/entities/progress_rules.dart';
import 'package:waraqah/features/shelves/shelves_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('progress is a percentage or pages; streaks count back', () {
    expect(ProgressRules.percentOf(155, 310), 50);
    ProgressProblem? check(int percent, [int? page, int? total]) =>
        ProgressRules.check((
          bookId: 'b',
          percent: percent,
          pagesRead: page,
          totalPages: total,
        ));
    expect(check(101), ProgressProblem.badPercent);
    expect(check(0, 20, 10), ProgressProblem.badPages);
    expect(check(0, 5), ProgressProblem.badPages);
    expect(check(40, 4, 10), isNull);

    final now = DateTime(2026, 10, 3, 9);
    final days = {DateTime(2026, 10, 2), DateTime(2026, 10, 1)};
    expect(ProgressRules.streak(days, now), 2);
    expect(ProgressRules.streak({...days, DateTime(2026, 10, 3)}, now), 3);
    expect(ProgressRules.streak({DateTime(2026, 9, 30)}, now), 0);
  });

  test('progress moves a Book along and counts the day', () {
    final now = DateTime(2026, 10, 3, 9);
    final store = ShelfFakeStore(OrderFakeStore(), clock: () => now);
    var stats = store.statsJson();
    expect((stats['finishedThisYear'], stats['streakDays']), (4, 3));
    expect(stats['readToday'], isFalse);
    expect((stats['topCategories'] as List), isNotEmpty);

    // Clean Code was only wanted: reading it puts it on Reading.
    expect(
      store.progress((
        bookId: 'bk-cleancode',
        percent: 0,
        pagesRead: 40,
        totalPages: 400,
      )),
      isTrue,
    );
    final clean = store.mine().firstWhere(
      (e) => (e['book'] as Map)['id'] == 'bk-cleancode',
    );
    expect((clean['shelf'], clean['progress']), ('reading', 10));
    stats = store.statsJson();
    expect((stats['streakDays'], stats['readToday']), (4, true));

    expect(
      store.progress((
        bookId: 'bk-hobbit',
        percent: 100,
        pagesRead: null,
        totalPages: null,
      )),
      isTrue,
    );
    expect(store.finishedCount, 5);
    expect((store.statsJson()['perMonth'] as List)[9], 1);
    expect(
      store.progress((
        bookId: 'bk-nope',
        percent: 5,
        pagesRead: null,
        totalPages: null,
      )),
      isFalse,
    );
  });

  testWidgets('finishing by pages offers to review, post or sell', (
    tester,
  ) async {
    await openApp(tester, ShelvesRoutes.shelves, role: 'reader');
    expect(find.text('Page 130 of 310'), findsOneWidget);
    await tester.tap(find.text('Update'));
    await settle(tester);
    await tester.enterText(find.byType(TextField).first, '310');
    await tester.tap(find.text('Save'));
    await settle(tester);

    expect(find.text('Finished The Hobbit?'), findsOneWidget);
    expect(find.text('Write a review'), findsOneWidget);
    expect(find.text('Post a Bite'), findsOneWidget);
  });

  testWidgets('the stats page shows the goal and sets a new one', (
    tester,
  ) async {
    await openApp(tester, ShelvesRoutes.stats, role: 'reader');
    expect(find.text('3-day streak'), findsOneWidget);
    expect(find.text('Favourite categories'), findsOneWidget);
    await tester.tap(find.text('Change goal'));
    await settle(tester);
    await tester.enterText(find.byType(TextField), '30');
    await tester.tap(find.text('Save'));
    await settle(tester);
    expect(find.textContaining('of 30 books'), findsOneWidget);
  });
}

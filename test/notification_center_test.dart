import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/features/notifications/presentation/widgets/notification_bell.dart';

import 'helpers/app_harness.dart';

/// The bell's badge text, or `null` when there is none.
String? _badge(WidgetTester tester) {
  final texts = find.descendant(
    of: find.byType(NotificationBell),
    matching: find.byType(Text),
  );
  return texts.evaluate().isEmpty
      ? null
      : (texts.evaluate().first.widget as Text).data;
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the badge goes up live, down on open, and to zero', (
    tester,
  ) async {
    final router = await openApp(tester, '/home', role: 'reader');
    expect(_badge(tester), '3');

    // Staff advance the gift order; the reader's badge goes up live.
    final dio = ProviderScope.containerOf(
      tester.element(find.byType(NotificationBell)),
    ).read(dioProvider);
    // Not awaited straight away: the fake API's delay runs on the test clock.
    final advance = dio.post<void>(
      '/admin/orders/advance',
      data: {'number': 'WQ-100215', 'status': 'delivered'},
    );
    await settle(tester);
    await advance;
    await settle(tester);
    expect(_badge(tester), '4');

    await tester.tap(find.byType(NotificationBell));
    await settle(tester);
    expect(pathOf(router), '/notifications');
    expect(find.text('Order WQ-100215: Delivered'), findsOneWidget);
    expect(find.text('Sapiens dropped in price'), findsOneWidget);

    await tester.tap(find.text('Order WQ-100215: Delivered'));
    await settle(tester);
    expect(pathOf(router), '/orders/WQ-100215');
    router.pop();
    await settle(tester);
    router.pop();
    await settle(tester);
    expect(_badge(tester), '3');

    await tester.tap(find.byType(NotificationBell));
    await settle(tester);
    expect(find.byTooltip('Mark all read'), findsOneWidget);

    await tester.tap(find.byTooltip('Mark all read'));
    await settle(tester);
    expect(find.byTooltip('Mark all read'), findsNothing);
    router.pop();
    await settle(tester);
    expect(find.byType(NotificationBell), findsOneWidget);
    expect(_badge(tester), isNull);
  });

  testWidgets('guests see no bell and are bounced from the center', (
    tester,
  ) async {
    final router = await openApp(tester, '/notifications');
    expect(pathOf(router), '/login');
    expect(find.byType(NotificationBell), findsNothing);
  });

  testWidgets('the center renders in Bangla with an empty fallback', (
    tester,
  ) async {
    await openApp(tester, '/notifications', role: 'reader', locale: 'bn');
    expect(tester.takeException(), isNull);
    expect(find.text('Sapiens-এর দাম কমেছে'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/features/orders/orders_routes.dart';

import 'helpers/app_harness.dart';

final _ordersAdmin = AdminRoutes.section(AdminSection.orders);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('readers can not open it', (tester) async {
    final router = await openApp(tester, _ordersAdmin, role: 'reader');
    expect(pathOf(router), HomeRoutes.home);
  });

  testWidgets('support moves an order to its next step', (tester) async {
    await openApp(tester, _ordersAdmin, role: 'support');

    expect(tester.takeException(), isNull);
    // WQ-100215 is shipped, so it can be marked delivered.
    await tester.tap(find.text('Mark as Delivered'));
    await settle(tester);

    expect(find.text('Mark as Delivered'), findsNothing);
    expect(find.text('Delivered'), findsNWidgets(3), reason: 'chip + 2 orders');
  });

  testWidgets('support approves a return the reader sees', (tester) async {
    final router = await openApp(
      tester,
      OrdersRoutes.detailsFor('WQ-100201'),
      role: 'superAdmin',
    );
    await tester.scrollUntilVisible(
      find.text('Request a return'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Request a return'));
    await settle(tester);
    await tester.tap(find.text('Send request'));
    await settle(tester);

    router.push(_ordersAdmin);
    await settle(tester);
    await tester.tap(find.text('Returns'));
    await settle(tester);
    await tester.tap(find.text('Approve'));
    await settle(tester);
    expect(find.text('No returns waiting.'), findsOneWidget);

    router.pop();
    await settle(tester);
    expect(find.text("Return approved, we'll pick it up"), findsOneWidget);
  });

  testWidgets('staff create a coupon', (tester) async {
    await openApp(tester, _ordersAdmin, role: 'support');
    await tester.tap(find.text('Coupons'));
    await settle(tester);
    expect(find.text('WELCOME10'), findsOneWidget);

    await tester.tap(find.text('New coupon'));
    await settle(tester);
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'boishakh20');
    await tester.enterText(fields.at(1), '20');
    await tester.tap(find.text('Create coupon'));
    await settle(tester);

    expect(find.text('Coupon created'), findsOneWidget);
    expect(find.text('BOISHAKH20'), findsOneWidget);
    expect(find.text('20% off'), findsOneWidget);
  });
}

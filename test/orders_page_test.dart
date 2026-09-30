import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/orders/orders_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('guests are asked to log in first', (tester) async {
    final router = await openApp(tester, OrdersRoutes.orders);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('lists orders newest first with where they are', (tester) async {
    await openApp(tester, OrdersRoutes.orders, role: 'reader');

    expect(tester.takeException(), isNull);
    final shipped = tester.getTopLeft(find.text('WQ-100215'));
    final delivered = tester.getTopLeft(find.text('WQ-100201'));
    expect(shipped.dy, lessThan(delivered.dy));
    expect(find.text('Shipped'), findsOneWidget);
    expect(find.text('Delivered'), findsOneWidget);
  });

  testWidgets('a delivered order can be sent back', (tester) async {
    await openApp(tester, OrdersRoutes.detailsFor('WQ-100201'), role: 'reader');
    expect(find.text('Cancel order'), findsNothing);

    await tester.scrollUntilVisible(
      find.text('Request a return'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Request a return'));
    await settle(tester);
    await tester.tap(find.text('I got the wrong book'));
    await tester.pump();
    await tester.tap(find.text('Send request'));
    await settle(tester);

    expect(find.text('Return requested, waiting for review'), findsOneWidget);
    expect(find.text('Request a return'), findsNothing);
  });

  testWidgets('a new order can be tracked and cancelled', (tester) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-atomic'),
      role: 'reader',
    );
    await tester.tap(find.text('Buy now'));
    await settle(tester);
    await tester.tap(find.text('Checkout'));
    await settle(tester);
    await tester.tap(find.text('Place order'));
    await settle(tester);

    await tester.tap(find.text('Track order'));
    await settle(tester);
    expect(pathOf(router), OrdersRoutes.detailsFor('WQ-100231'));
    expect(find.text('Placed'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Cancel order'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Cancel order'));
    await settle(tester);
    // The dialog's own Cancel order button.
    await tester.tap(find.text('Cancel order').last);
    await settle(tester);

    expect(find.text('Order cancelled'), findsOneWidget);
    expect(find.text('Cancel order'), findsNothing);
  });
}

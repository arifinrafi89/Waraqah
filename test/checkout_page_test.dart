import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/checkout/checkout_routes.dart';

import 'helpers/app_harness.dart';

/// Opens [bookId]'s page as [role], picks [edition] if given, taps Buy now
/// and then Checkout.
Future<GoRouter> _toCheckout(
  WidgetTester tester, {
  String bookId = 'bk-atomic',
  String? edition,
  String? role = 'reader',
}) async {
  final router = await openApp(
    tester,
    CatalogRoutes.bookDetailFor(bookId),
    role: role,
  );
  if (edition != null) {
    await tester.tap(find.text(edition));
    await tester.pump();
  }
  await tester.tap(find.text('Buy now'));
  await settle(tester);
  await tester.tap(find.text('Checkout'));
  await settle(tester);
  return router;
}

Future<void> _scrollTo(WidgetTester tester, Finder finder) => tester
    .scrollUntilVisible(finder, 200, scrollable: find.byType(Scrollable).last);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('guests are asked to log in first', (tester) async {
    final router = await _toCheckout(tester, role: null);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('address, delivery and totals follow the choices', (
    tester,
  ) async {
    // Atomic Habits paperback: ৳590.
    final router = await _toCheckout(tester);
    expect(pathOf(router), CheckoutRoutes.checkout);
    expect(tester.takeException(), isNull);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Arrives in 1–2 days'), findsOneWidget);
    expect(find.text('Delivery fee ৳60'), findsOneWidget);
    expect(find.text('৳650'), findsWidgets);

    await tester.tap(find.text('Family home'));
    await tester.pump();
    expect(find.text('Arrives in 3–5 days'), findsOneWidget);
    expect(find.text('৳710'), findsWidgets);

    await _scrollTo(tester, find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'eid100');
    await tester.tap(find.text('Apply'));
    await settle(tester);
    expect(
      find.text('This code needs an order of ৳1,000 or more.'),
      findsOneWidget,
    );

    await tester.enterText(find.byType(TextField), ' welcome10 ');
    await tester.tap(find.text('Apply'));
    await settle(tester);
    expect(find.text('WELCOME10 applied'), findsOneWidget);
    // 590 + 120 delivery - 59 (10%).
    expect(find.text('৳651'), findsWidgets);
  });

  testWidgets('placing an order shows its number and empties the cart', (
    tester,
  ) async {
    final router = await _toCheckout(tester);

    await tester.tap(find.text('Place order'));
    await settle(tester);

    expect(pathOf(router), CheckoutRoutes.placed);
    expect(find.text('Order placed!'), findsOneWidget);
    expect(find.text('Order WQ-100231'), findsOneWidget);
    expect(find.text('Paid ৳650 with bKash'), findsOneWidget);

    await tester.tap(find.text('Continue shopping'));
    await settle(tester);
    // The bag on Home has no count any more.
    expect(find.text('1'), findsNothing);
  });

  testWidgets('eBook-only orders skip delivery and cash on delivery', (
    tester,
  ) async {
    await _toCheckout(tester, bookId: 'bk-sapiens', edition: 'eBook · English');

    expect(
      find.text('eBooks are ready to read as soon as you pay'),
      findsOneWidget,
    );
    await _scrollTo(tester, find.text('Not available for eBook-only orders'));
    expect(find.text('Not available for eBook-only orders'), findsOneWidget);
  });
}

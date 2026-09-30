import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/cart/cart_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/checkout/checkout_routes.dart';

import 'helpers/app_harness.dart';

/// Atomic Habits paperback: ৳590 (was ৳650), 30 in stock.
final _atomic = CatalogRoutes.bookDetailFor('bk-atomic');

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('an empty cart points back to the books', (tester) async {
    await openApp(tester, CartRoutes.cart);

    expect(tester.takeException(), isNull);
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Browse books'), findsOneWidget);
  });

  testWidgets('add to cart confirms and fills the badge', (tester) async {
    await openApp(tester, _atomic);

    await tester.tap(find.byTooltip('Add to cart'));
    await settle(tester);

    expect(find.text('Added to cart'), findsOneWidget);
    expect(find.text('View cart'), findsOneWidget);
    // The bag in the top bar now counts one copy.
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('buy now opens the cart; quantities change the subtotal', (
    tester,
  ) async {
    final router = await openApp(tester, _atomic);

    await tester.tap(find.text('Buy now'));
    await settle(tester);

    expect(pathOf(router), CartRoutes.cart);
    expect(find.text('James Clear'), findsOneWidget);
    expect(find.text('Paperback · English'), findsOneWidget);
    expect(find.text('1 item'), findsOneWidget);
    expect(find.text('You save ৳60'), findsOneWidget);

    await tester.tap(find.byTooltip('Add one'));
    await settle(tester);
    expect(find.text('2 items'), findsOneWidget);
    expect(find.text('৳590 each'), findsOneWidget);
    // Line total and subtotal.
    expect(find.text('৳1,180'), findsNWidgets(2));

    await tester.tap(find.byTooltip('Remove one'));
    await settle(tester);
    await tester.tap(find.byTooltip('Remove'));
    await settle(tester);
    expect(find.text('Your cart is empty'), findsOneWidget);
  });

  testWidgets('+ stops at the stock and stays on the cart', (tester) async {
    // The hardcover has 2 in stock.
    final router = await openApp(tester, _atomic);
    await tester.tap(find.text('Hardcover · English'));
    await tester.pump();
    await tester.tap(find.text('Buy now'));
    await settle(tester);

    await tester.tap(find.byTooltip('Add one'));
    await settle(tester);
    await tester.tap(find.byTooltip('Add one'), warnIfMissed: false);
    await settle(tester);

    expect(find.text('2 items'), findsOneWidget);
    expect(pathOf(router), CartRoutes.cart);
  });

  testWidgets('checkout opens checkout for a signed-in reader', (tester) async {
    final router = await openApp(tester, _atomic, role: 'reader');
    await tester.tap(find.text('Buy now'));
    await settle(tester);

    await tester.tap(find.text('Checkout'));
    await settle(tester);
    expect(pathOf(router), CheckoutRoutes.checkout);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/cart/cart_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/wishlist/wishlist_routes.dart';

import 'helpers/app_harness.dart';

final _atomic = CatalogRoutes.bookDetailFor('bk-atomic');

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('an empty wishlist points back to the books', (tester) async {
    await openApp(tester, WishlistRoutes.wishlist);

    expect(tester.takeException(), isNull);
    expect(find.text('Your wishlist is empty'), findsOneWidget);
  });

  testWidgets('the heart saves a book, and it shows on the wishlist', (
    tester,
  ) async {
    final router = await openApp(tester, _atomic);

    await tester.tap(find.byTooltip('Save to wishlist'));
    await settle(tester);
    expect(find.byTooltip('Remove from wishlist'), findsOneWidget);
    expect(find.text('Saved to your wishlist'), findsOneWidget);

    router.push(WishlistRoutes.wishlist);
    await settle(tester);
    expect(find.text('James Clear'), findsOneWidget);
    expect(find.text('1 book'), findsOneWidget);
  });

  testWidgets('move to cart empties the wishlist and fills the cart', (
    tester,
  ) async {
    final router = await openApp(tester, _atomic);
    await tester.tap(find.byTooltip('Save to wishlist'));
    await settle(tester);
    router.push(WishlistRoutes.wishlist);
    await settle(tester);

    await tester.tap(find.byTooltip('Move to cart'));
    await settle(tester);

    expect(find.text('Your wishlist is empty'), findsOneWidget);
    expect(find.text('Added to cart'), findsOneWidget);
    // The cart button in the top bar counts one copy.
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('save for later moves a cart line to the wishlist', (
    tester,
  ) async {
    final router = await openApp(tester, _atomic);
    await tester.tap(find.text('Buy now'));
    await settle(tester);
    expect(router.state.uri.path, CartRoutes.cart);

    await tester.tap(find.text('Save for later'));
    await settle(tester);
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Moved to your wishlist'), findsOneWidget);

    await tester.tap(find.widgetWithText(SnackBarAction, 'View'));
    await settle(tester);
    expect(router.state.uri.path, WishlistRoutes.wishlist);
    expect(find.text('James Clear'), findsOneWidget);
  });
}

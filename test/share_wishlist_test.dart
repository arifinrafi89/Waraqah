import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/wishlist/presentation/widgets/shared_wishlist_tile.dart';
import 'package:waraqah/features/wishlist/wishlist_routes.dart';

import 'helpers/app_harness.dart';

final _atomic = CatalogRoutes.bookDetailFor('bk-atomic');
const _myLink = 'https://waraqah.app/wishlist/shared/wl-mine';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a friend opens a shared wishlist and adds a book to the cart', (
    tester,
  ) async {
    await openApp(tester, WishlistRoutes.sharedFor('wl-nabila'));

    expect(tester.takeException(), isNull);
    expect(find.text("Nabila's wishlist"), findsOneWidget);
    expect(find.text('3 books'), findsOneWidget);
    expect(find.textContaining('Buying one for Nabila?'), findsOneWidget);

    await tester.tap(find.byTooltip('Add to cart').first);
    await settle(tester);
    expect(find.text('Added to cart'), findsOneWidget);
  });

  testWidgets('a link to no list says so', (tester) async {
    await openApp(tester, WishlistRoutes.sharedFor('wl-nobody'));
    expect(find.text("This wishlist isn't shared any more."), findsOneWidget);
  });

  testWidgets('a reader copies their link and sees it as friends do', (
    tester,
  ) async {
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String?;
        }
        return null;
      },
    );
    final router = await openApp(tester, _atomic, role: 'reader');
    await tester.tap(find.byTooltip('Save to wishlist'));
    await settle(tester);
    router.push(WishlistRoutes.wishlist);
    await settle(tester);

    await tester.tap(find.byTooltip('Share wishlist'));
    await settle(tester);
    expect(find.text(_myLink), findsOneWidget);
    await tester.tap(find.text('Copy link'));
    await settle(tester);
    expect(copied, _myLink);
    expect(find.text('Link copied'), findsOneWidget);

    await tester.tap(find.byTooltip('Share wishlist'));
    await settle(tester);
    await tester.tap(find.text('See it as friends do'));
    await settle(tester);
    expect(pathOf(router), WishlistRoutes.sharedFor('wl-mine'));
    // The test reader is called "Test".
    expect(find.text("Test's wishlist"), findsOneWidget);
    expect(find.byType(SharedWishlistTile), findsOneWidget);
    expect(
      find.widgetWithText(SharedWishlistTile, 'James Clear'),
      findsOneWidget,
    );
  });

  testWidgets('guests have nothing to share', (tester) async {
    final router = await openApp(tester, _atomic);
    await tester.tap(find.byTooltip('Save to wishlist'));
    await settle(tester);
    router.push(WishlistRoutes.wishlist);
    await settle(tester);
    expect(find.byTooltip('Share wishlist'), findsNothing);
  });
}

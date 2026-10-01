import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/cart/cart_routes.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/cart/domain/entities/smart_basket.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/domain/entities/used_options.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';

import 'helpers/app_harness.dart';

CartLine _line(String bookId, int price, {int quantity = 1}) => CartLine(
  id: 'l-$bookId',
  kind: CartItemKind.edition,
  itemId: 'e-$bookId',
  bookId: bookId,
  title: bookId,
  author: 'A',
  unitPriceBdt: price,
  quantity: quantity,
  maxQuantity: 10,
  format: BookFormat.paperback,
);

UsedOptions _used(int certified) => UsedOptions(
  certifiedUsed: UsedCopy(
    id: 'cu',
    priceBdt: certified,
    condition: BookCondition.good,
  ),
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  final basket = SmartBasket.of(
    Cart(
      lines: [_line('a', 590), _line('b', 650), _line('c', 300, quantity: 2)],
    ),
    {'a': _used(380), 'b': _used(420), 'c': _used(100)},
    freeDeliveryFromBdt: 2500,
  );

  test('suggests the cheapest used copy, biggest saving first', () {
    // b saves ৳230, a ৳210; c has two copies, so it isn't swapped.
    expect([for (final s in basket.swaps) s.line.bookId], ['b', 'a']);
    expect(basket.usedSavingsBdt, 230 + 210);
    // 590 + 650 + 600 = 1840.
    expect(basket.toFreeDeliveryBdt, 660);
  });

  test('budget mode swaps only as much as it needs to', () {
    final fits = basket.planFor(1650);
    expect((fits.swaps.length, fits.totalBdt, fits.fits), (1, 1610, true));

    final short = basket.planFor(1000);
    expect((short.swaps.length, short.totalBdt, short.fits), (2, 1400, false));
  });

  testWidgets('the cart suggests used copies and switches them', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-atomic'),
    );
    await tester.tap(find.byTooltip('Add to cart'));
    await settle(tester);
    router.push(CartRoutes.cart);
    await settle(tester);

    expect(find.text('Smart Basket'), findsOneWidget);
    // Atomic Habits Certified Used at ৳380 instead of ৳590.
    expect(find.text('1 book is available used, save ৳210'), findsOneWidget);
    expect(find.text('Add ৳910 more for free delivery'), findsOneWidget);

    await tester.tap(find.text('Switch'));
    // Two requests: add the used copy, then remove the new one.
    await settle(tester);
    await settle(tester);
    expect(find.text('Switched to used · saved ৳210'), findsOneWidget);
    expect(find.text('Certified Used · Very good'), findsOneWidget);
  });
}

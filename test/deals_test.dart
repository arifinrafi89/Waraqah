import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/cart/data/models/cart_model.dart';
import 'package:waraqah/features/cart/data/sources/cart_fake_store.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/deals/data/sources/deals_fake_store.dart';
import 'package:waraqah/features/deals/deals_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('the cart charges deals', () {
    var now = DateTime(2026, 9, 30, 12);
    late CartFakeStore cart;
    Cart read() => CartModel.fromJson(cart.toJson()).toEntity();
    setUp(() {
      now = DateTime(2026, 9, 30, 12);
      cart = CartFakeStore(deals: DealsFakeStore(clock: () => now));
    });

    test('flash prices while the sale is on, the usual price after', () {
      cart.add('edition', 'bk-sherlock-pb-en');
      final line = read().lines.single;
      expect((line.unitPriceBdt, line.listPriceBdt), (299, 380));

      now = now.add(const Duration(hours: 7));
      cart.add('edition', 'bk-zero-pb-en');
      expect(read().lines.last.unitPriceBdt, 520);
    });

    test('a bundle is one line at the bundle price', () {
      cart.add('bundle', 'big-ideas');
      final line = read().lines.single;
      expect(line.kind, CartItemKind.bundle);
      // Sapiens ৳650 + Atomic Habits ৳590 + Zero to One ৳520 = ৳1,760.
      expect((line.unitPriceBdt, line.savingsBdt), (1450, 310));
    });
  });

  testWidgets('a flash-sale book shows the sale price and countdown', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-sherlock'));
    // The page opens on the eBook, the cheapest; the paperback is on sale.
    await tester.tap(find.text('Paperback · English'));
    await tester.pump();
    // In the paperback's tile and in the bottom bar.
    expect(find.text('৳299'), findsNWidgets(2));
    expect(find.text('Flash sale ends in'), findsOneWidget);
  });

  testWidgets('a book in a bundle deals it, and it goes in the cart', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-atomic'));
    await tester.scrollUntilVisible(
      find.text('Add bundle to cart'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.ensureVisible(find.text('Add bundle to cart'));
    await settle(tester);
    expect(find.text('Buy it in a bundle'), findsOneWidget);

    await tester.tap(find.text('Add bundle to cart'));
    await settle(tester);
    expect(find.text('Added to cart'), findsOneWidget);
  });

  testWidgets('a pre-order says when it comes out', (tester) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-bidayah'));
    expect(find.text('Pre-order'), findsWidgets);
    expect(find.textContaining('ships on release day'), findsOneWidget);
  });

  testWidgets('the deals page lists the sale, bundles and pre-orders', (
    tester,
  ) async {
    await openApp(tester, DealsRoutes.deals);
    expect(tester.takeException(), isNull);
    expect(find.text('Flash sale'), findsOneWidget);
    expect(find.text('Big ideas bundle'), findsOneWidget);
  });
}

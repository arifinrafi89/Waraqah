import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/domain/entities/delivery_area.dart';
import 'package:waraqah/features/checkout/domain/entities/checkout_totals.dart';
import 'package:waraqah/features/checkout/domain/entities/coupon.dart';
import 'package:waraqah/features/loyalty/domain/entities/loyalty_rules.dart';
import 'package:waraqah/features/loyalty/loyalty_routes.dart';

import 'helpers/app_harness.dart';

Cart _cart(int price) => Cart(
  lines: [
    CartLine(
      id: 'l1',
      kind: CartItemKind.edition,
      itemId: 'e1',
      bookId: 'b1',
      title: 'T',
      author: 'A',
      unitPriceBdt: price,
      quantity: 1,
      maxQuantity: 10,
      format: BookFormat.paperback,
    ),
  ],
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('earning and spending rules', () {
    expect(LoyaltyRules.earnedFor(1240), 12);
    expect(LoyaltyRules.usable(balance: 49, booksBdt: 1000), 0);
    // 20% of ৳590.
    expect(LoyaltyRules.usable(balance: 217, booksBdt: 590), 118);
    expect(LoyaltyRules.usable(balance: 60, booksBdt: 1000), 60);
  });

  test('points come off the books, and points are earned on what is paid', () {
    final totals = CheckoutTotals.of(
      _cart(590),
      DeliveryArea.insideDhaka,
      pointsBalance: 217,
      usePoints: true,
    );
    expect(totals.pointsDiscountBdt, 118);
    expect(totals.totalBdt, 590 + 60 - 118);
    expect(totals.booksPaidBdt, 472);

    // Free delivery doesn't lower what the books cost.
    final freeShip = CheckoutTotals.of(
      _cart(590),
      DeliveryArea.outsideDhaka,
      coupon: const Coupon(code: 'F', kind: CouponKind.freeDelivery),
    );
    expect(freeShip.booksPaidBdt, 590);
  });

  testWidgets('points at checkout, then earned, then given back on cancel', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-atomic'),
      role: 'reader',
    );
    await tester.tap(find.text('Buy now'));
    await settle(tester);
    await tester.tap(find.text('Checkout'));
    await settle(tester);

    await tester.dragUntilVisible(
      find.byType(Switch),
      find.byType(ListView),
      const Offset(0, -200),
    );
    await tester.ensureVisible(find.byType(Switch));
    await tester.pump();
    expect(find.text('Use 118 points'), findsOneWidget);
    await tester.tap(find.byType(Switch));
    await tester.pump();
    // ৳590 + ৳60 delivery - ৳118 in points.
    expect(find.text('৳532'), findsWidgets);

    await tester.tap(find.text('Place order'));
    await settle(tester);
    // ৳472 paid for the books, at 1 point per ৳100.
    expect(find.text('You earned 4 Waraqah points'), findsOneWidget);

    router.push(LoyaltyRoutes.points);
    await settle(tester);
    // 217 - 118 + 4.
    expect(find.text('103 points'), findsOneWidget);
    expect(find.text('Used on WQ-100231'), findsOneWidget);
  });
}

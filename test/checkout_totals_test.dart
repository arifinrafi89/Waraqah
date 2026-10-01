import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/catalog/domain/entities/delivery_area.dart';
import 'package:waraqah/features/checkout/domain/entities/checkout_totals.dart';
import 'package:waraqah/features/checkout/domain/entities/coupon.dart';

Cart _cart(int price, {BookFormat format = BookFormat.paperback}) => Cart(
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
      format: format,
    ),
  ],
);

const _inside = DeliveryArea.insideDhaka;
const _outside = DeliveryArea.outsideDhaka;

void main() {
  group('delivery fee', () {
    test('৳60 inside Dhaka, ৳120 outside', () {
      expect(CheckoutTotals.of(_cart(500), _inside).deliveryFeeBdt, 60);
      expect(CheckoutTotals.of(_cart(500), _outside).deliveryFeeBdt, 120);
      expect(CheckoutTotals.of(_cart(500), _outside).totalBdt, 620);
    });

    test('free from ৳1,500', () {
      expect(CheckoutTotals.of(_cart(1500), _outside).deliveryFeeBdt, 0);
    });

    test('never charged for eBooks only', () {
      final totals = CheckoutTotals.of(
        _cart(400, format: BookFormat.ebook),
        _outside,
      );
      expect(totals.needsDelivery, isFalse);
      expect(totals.deliveryFeeBdt, 0);
    });
  });

  group('coupons', () {
    const percent = Coupon(
      code: 'P',
      kind: CouponKind.percentOff,
      value: 10,
      maxDiscountBdt: 150,
    );
    const amount = Coupon(
      code: 'A',
      kind: CouponKind.amountOff,
      value: 100,
      minOrderBdt: 1000,
    );
    const freeShip = Coupon(code: 'F', kind: CouponKind.freeDelivery);

    int discount(int price, Coupon coupon) => CheckoutTotals.of(
      _cart(price),
      _outside,
      coupon: coupon,
    ).couponDiscountBdt;

    test('percent off is capped', () {
      expect(discount(590, percent), 59);
      expect(discount(1400, percent), 140);
      expect(discount(3000, percent), 150);
    });

    test('amount off needs the minimum order', () {
      expect(discount(999, amount), 0);
      expect(discount(1000, amount), 100);
    });

    test('free delivery takes the fee off', () {
      final totals = CheckoutTotals.of(_cart(500), _outside, coupon: freeShip);
      expect(totals.couponDiscountBdt, 120);
      expect(totals.totalBdt, 500);
    });
  });
}

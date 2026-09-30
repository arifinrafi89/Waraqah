import 'dart:math';

import '../../../../core/models/edition.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../../catalog/domain/entities/delivery_area.dart';
import 'coupon.dart';

/// What an order costs, worked out the same way on the phone and on the
/// server:
/// - delivery is ৳60 inside Dhaka, ৳120 outside, free from ৳1,500, and not
///   charged at all when the order is only eBooks
/// - a coupon only works once the subtotal reaches its minimum
class CheckoutTotals {
  const CheckoutTotals({
    required this.subtotalBdt,
    required this.deliveryFeeBdt,
    required this.couponDiscountBdt,
    required this.needsDelivery,
  });

  factory CheckoutTotals.of(Cart cart, DeliveryArea area, {Coupon? coupon}) {
    final subtotal = cart.subtotalBdt;
    final needsDelivery = cart.lines.any(
      (line) => line.format != BookFormat.ebook,
    );
    final fee = !needsDelivery || subtotal >= freeDeliveryFromBdt
        ? 0
        : switch (area) {
            DeliveryArea.insideDhaka => 60,
            DeliveryArea.outsideDhaka => 120,
          };
    return CheckoutTotals(
      subtotalBdt: subtotal,
      deliveryFeeBdt: fee,
      couponDiscountBdt: coupon == null ? 0 : _discount(coupon, subtotal, fee),
      needsDelivery: needsDelivery,
    );
  }

  static const int freeDeliveryFromBdt = 1500;

  final int subtotalBdt;
  final int deliveryFeeBdt;
  final int couponDiscountBdt;

  /// False when every item is an eBook.
  final bool needsDelivery;

  int get totalBdt => subtotalBdt + deliveryFeeBdt - couponDiscountBdt;

  static int _discount(Coupon coupon, int subtotal, int fee) {
    if (subtotal < coupon.minOrderBdt) return 0;
    return switch (coupon.kind) {
      CouponKind.percentOff => min(
        subtotal * coupon.value ~/ 100,
        coupon.maxDiscountBdt ?? subtotal,
      ),
      CouponKind.amountOff => min(coupon.value, subtotal),
      CouponKind.freeDelivery => fee,
    };
  }
}

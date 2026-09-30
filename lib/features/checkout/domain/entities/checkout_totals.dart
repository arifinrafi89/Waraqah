import 'dart:math';

import '../../../../core/models/edition.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../../catalog/domain/entities/delivery_area.dart';
import '../../../loyalty/domain/entities/loyalty_rules.dart';
import 'coupon.dart';
import 'gift.dart';

/// What an order costs, worked out the same way on the phone and on the
/// server:
/// - delivery is ৳60 inside Dhaka, ৳120 outside, free from ৳1,500, and not
///   charged at all when the order is only eBooks
/// - a coupon only works once the subtotal reaches its minimum
/// - points pay for part of the books (see `LoyaltyRules`), never delivery
/// - gift wrap is ৳40, for orders that get delivered
/// - the wallet pays last, for whatever is left, delivery included
class CheckoutTotals {
  const CheckoutTotals({
    required this.subtotalBdt,
    required this.deliveryFeeBdt,
    required this.couponDiscountBdt,
    required this.needsDelivery,
    this.pointsDiscountBdt = 0,
    this.couponOnBooksBdt = 0,
    this.giftWrapBdt = 0,
    this.walletBdt = 0,
  });

  /// With [usePoints], as many of the [pointsBalance] points as the rules
  /// allow come off.
  factory CheckoutTotals.of(
    Cart cart,
    DeliveryArea area, {
    Coupon? coupon,
    int pointsBalance = 0,
    bool usePoints = false,
    bool giftWrap = false,
    int walletBalance = 0,
    bool useWallet = false,
  }) {
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
    final couponOff = coupon == null ? 0 : _discount(coupon, subtotal, fee);
    final booksOff = coupon?.kind == CouponKind.freeDelivery ? 0 : couponOff;
    final wrap = giftWrap && needsDelivery ? Gift.wrapFeeBdt : 0;
    final points = usePoints
        ? LoyaltyRules.usable(
            balance: pointsBalance,
            booksBdt: subtotal - booksOff,
          )
        : 0;
    final beforeWallet = subtotal + fee + wrap - couponOff - points;
    return CheckoutTotals(
      subtotalBdt: subtotal,
      deliveryFeeBdt: fee,
      couponDiscountBdt: couponOff,
      needsDelivery: needsDelivery,
      couponOnBooksBdt: booksOff,
      giftWrapBdt: wrap,
      pointsDiscountBdt: points,
      walletBdt: useWallet ? min(max(walletBalance, 0), beforeWallet) : 0,
    );
  }

  static const int freeDeliveryFromBdt = 1500;

  final int subtotalBdt;
  final int deliveryFeeBdt;
  final int couponDiscountBdt;

  /// Points used, at ৳1 each.
  final int pointsDiscountBdt;

  /// The part of the coupon that came off the books (not free delivery).
  final int couponOnBooksBdt;

  final int giftWrapBdt;

  /// Paid from the wallet.
  final int walletBdt;

  /// False when every item is an eBook.
  final bool needsDelivery;

  /// What the order comes to before the wallet.
  int get beforeWalletBdt =>
      subtotalBdt +
      deliveryFeeBdt +
      giftWrapBdt -
      couponDiscountBdt -
      pointsDiscountBdt;

  /// What's left to pay with the chosen method.
  int get totalBdt => beforeWalletBdt - walletBdt;

  /// What's paid for the books themselves; points are earned on this.
  int get booksPaidBdt =>
      max(0, subtotalBdt - couponOnBooksBdt - pointsDiscountBdt);

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

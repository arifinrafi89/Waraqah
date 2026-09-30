import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon.freezed.dart';

enum CouponKind { percentOff, amountOff, freeDelivery }

/// A code the reader types at checkout. Admins create these (the orders and
/// coupons admin comes in a later PR).
@freezed
abstract class Coupon with _$Coupon {
  const factory Coupon({
    required String code,
    required CouponKind kind,

    /// Percent for [CouponKind.percentOff], taka for [CouponKind.amountOff],
    /// unused for free delivery.
    @Default(0) int value,

    /// The subtotal needed before the code works.
    @Default(0) int minOrderBdt,

    /// Most a percent-off code can take off.
    int? maxDiscountBdt,
  }) = _Coupon;
}

/// Why a code was turned down.
enum CouponProblem { notFound, belowMinimum }

class CouponRejected implements Exception {
  const CouponRejected(this.problem, {this.minOrderBdt = 0});

  final CouponProblem problem;
  final int minOrderBdt;
}

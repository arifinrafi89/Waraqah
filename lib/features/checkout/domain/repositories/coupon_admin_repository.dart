import '../entities/coupon.dart';

/// Coupons as staff see them in the Admin area.
abstract interface class CouponAdminRepository {
  /// Every coupon, newest first, expired ones included.
  Future<List<Coupon>> coupons();

  /// Answers the updated list, or `null` when the code is already taken.
  Future<List<Coupon>?> create(Coupon coupon);
}

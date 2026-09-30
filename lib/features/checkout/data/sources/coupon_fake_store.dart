import '../../domain/entities/coupon.dart';
import '../models/coupon_model.dart';
import 'checkout_fixtures.dart';

/// The coupons the fake backend knows: the demo ones plus any staff create
/// in the Admin area. Checkout looks codes up here.
class CouponFakeStore {
  CouponFakeStore({DateTime Function()? clock}) : _now = clock ?? DateTime.now;

  final DateTime Function() _now;
  final List<CouponModel> _coupons = [...CheckoutFixtures.coupons];

  /// Newest first.
  List<CouponModel> get all => _coupons.reversed.toList();

  /// Any coupon with [code], expired or not, so checkout can say why.
  CouponModel? find(String code) {
    final wanted = code.trim().toUpperCase();
    return _coupons.where((c) => c.code == wanted).firstOrNull;
  }

  /// A coupon an order may use right now: known and not expired.
  CouponModel? usable(String code) {
    final coupon = find(code);
    return coupon == null || coupon.toEntity().isExpiredAt(_now())
        ? null
        : coupon;
  }

  /// `false` when a coupon with that code already exists.
  bool add(CouponModel coupon) {
    if (find(coupon.code) != null) return false;
    _coupons.add(coupon.copyWith(code: coupon.code.trim().toUpperCase()));
    return true;
  }
}

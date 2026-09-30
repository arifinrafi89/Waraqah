import '../../../../core/usecase/usecase.dart';
import '../entities/coupon.dart';
import '../repositories/coupon_admin_repository.dart';

/// What's wrong with a new coupon.
enum CouponFormProblem { code, value, expiry, taken }

class CouponNotCreated implements Exception {
  const CouponNotCreated(this.problem);

  final CouponFormProblem problem;
}

/// Checks a new coupon and saves it. Rules:
/// - the code is 3–20 letters or digits (stored in capitals)
/// - percent off is 1–90%, amount off at least ৳1
/// - the minimum order and cap can't be negative
/// - an expiry date must be in the future
/// Throws [CouponNotCreated] with the first problem found.
class CreateCoupon extends UseCase<List<Coupon>, Coupon> {
  CreateCoupon(this._repository, {DateTime Function()? clock})
    : _now = clock ?? DateTime.now;

  final CouponAdminRepository _repository;
  final DateTime Function() _now;

  static final _codePattern = RegExp(r'^[A-Z0-9]{3,20}$');

  @override
  Future<List<Coupon>> call(Coupon params) async {
    final coupon = params.copyWith(code: params.code.trim().toUpperCase());
    final problem = _problem(coupon);
    if (problem != null) throw CouponNotCreated(problem);
    final saved = await _repository.create(coupon);
    if (saved == null) throw const CouponNotCreated(CouponFormProblem.taken);
    return saved;
  }

  CouponFormProblem? _problem(Coupon coupon) {
    if (!_codePattern.hasMatch(coupon.code)) return CouponFormProblem.code;
    final valueOk = switch (coupon.kind) {
      CouponKind.percentOff => coupon.value >= 1 && coupon.value <= 90,
      CouponKind.amountOff => coupon.value >= 1,
      CouponKind.freeDelivery => true,
    };
    if (!valueOk ||
        coupon.minOrderBdt < 0 ||
        (coupon.maxDiscountBdt ?? 0) < 0) {
      return CouponFormProblem.value;
    }
    final expiry = coupon.expiresAt;
    if (expiry != null && !expiry.isAfter(_now())) {
      return CouponFormProblem.expiry;
    }
    return null;
  }
}

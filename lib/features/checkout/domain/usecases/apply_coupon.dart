import '../../../../core/usecase/usecase.dart';
import '../entities/coupon.dart';
import '../repositories/checkout_repository.dart';

class ApplyCouponParams {
  const ApplyCouponParams({required this.code, required this.subtotalBdt});

  final String code;
  final int subtotalBdt;
}

/// Looks a code up (spaces and case don't matter) and checks the order is
/// big enough for it. Throws [CouponRejected] when it can't be used.
class ApplyCoupon extends UseCase<Coupon, ApplyCouponParams> {
  ApplyCoupon(this._repository);

  final CheckoutRepository _repository;

  @override
  Future<Coupon> call(ApplyCouponParams params) async {
    final code = params.code.trim().toUpperCase();
    if (code.isEmpty) throw const CouponRejected(CouponProblem.notFound);
    final coupon = await _repository.findCoupon(code);
    if (coupon == null) throw const CouponRejected(CouponProblem.notFound);
    if (params.subtotalBdt < coupon.minOrderBdt) {
      throw CouponRejected(
        CouponProblem.belowMinimum,
        minOrderBdt: coupon.minOrderBdt,
      );
    }
    return coupon;
  }
}

import '../../../../core/usecase/usecase.dart';
import '../entities/coupon.dart';
import '../repositories/coupon_admin_repository.dart';

class GetCoupons extends UseCase<List<Coupon>, NoParams> {
  GetCoupons(this._repository);

  final CouponAdminRepository _repository;

  @override
  Future<List<Coupon>> call(NoParams params) => _repository.coupons();
}

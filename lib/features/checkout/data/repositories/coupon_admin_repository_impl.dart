import '../../domain/entities/coupon.dart';
import '../../domain/repositories/coupon_admin_repository.dart';
import '../models/coupon_model.dart';
import '../sources/coupon_admin_remote_source.dart';

class CouponAdminRepositoryImpl implements CouponAdminRepository {
  CouponAdminRepositoryImpl(this._source);

  final CouponAdminRemoteSource _source;

  @override
  Future<List<Coupon>> coupons() async => [
    for (final coupon in await _source.coupons()) coupon.toEntity(),
  ];

  @override
  Future<List<Coupon>?> create(Coupon coupon) async {
    final saved = await _source.create(coupon);
    return saved == null ? null : [for (final c in saved) c.toEntity()];
  }
}

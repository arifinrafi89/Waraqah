import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/coupon_admin_repository_impl.dart';
import '../../data/sources/coupon_admin_remote_source.dart';
import '../../domain/entities/coupon.dart';
import '../../domain/repositories/coupon_admin_repository.dart';
import '../../domain/usecases/create_coupon.dart';
import '../../domain/usecases/get_coupons.dart';

final couponAdminRepositoryProvider = Provider<CouponAdminRepository>(
  (ref) => CouponAdminRepositoryImpl(
    CouponAdminRemoteSource(ref.watch(dioProvider)),
  ),
);

final getCouponsProvider = Provider<GetCoupons>(
  (ref) => GetCoupons(ref.watch(couponAdminRepositoryProvider)),
);

final createCouponProvider = Provider<CreateCoupon>(
  (ref) => CreateCoupon(ref.watch(couponAdminRepositoryProvider)),
);

/// Every coupon, for staff. Newest first.
class CouponsNotifier extends AsyncNotifier<List<Coupon>> {
  @override
  Future<List<Coupon>> build() =>
      ref.read(getCouponsProvider).call(const NoParams());

  /// Throws `CouponNotCreated` when the coupon isn't valid or the code is
  /// taken; the list stays as it was.
  Future<void> create(Coupon coupon) async {
    state = AsyncData(await ref.read(createCouponProvider).call(coupon));
  }
}

final couponsProvider = AsyncNotifierProvider<CouponsNotifier, List<Coupon>>(
  CouponsNotifier.new,
);

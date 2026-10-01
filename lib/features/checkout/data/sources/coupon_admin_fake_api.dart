import 'package:dio/dio.dart';

import '../models/coupon_model.dart';
import 'coupon_fake_store.dart';

/// The Admin area's coupon endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. The real backend checks the caller is staff.
abstract final class CouponAdminFakeApi {
  /// Every coupon, newest first.
  static const String coupons = '/admin/coupons';

  /// Body: a coupon. Answers the updated list, or `null` if the code is
  /// already taken.
  static const String create = '/admin/coupons/create';

  static Map<String, Object? Function(RequestOptions)> routes(
    CouponFakeStore store,
  ) {
    List<Object?> answer() => [for (final c in store.all) c.toJson()];
    return {
      coupons: (_) => answer(),
      create: (options) {
        final coupon = CouponModel.fromJson(
          options.data as Map<String, dynamic>,
        );
        return store.add(coupon) ? answer() : null;
      },
    };
  }
}

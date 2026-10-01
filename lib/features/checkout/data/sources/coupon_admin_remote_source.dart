import 'package:dio/dio.dart';

import '../../domain/entities/coupon.dart';
import '../models/coupon_model.dart';
import 'coupon_admin_fake_api.dart';

/// Talks to the `/admin/coupons` endpoints, answered for now by the fake API.
class CouponAdminRemoteSource {
  CouponAdminRemoteSource(this._dio);

  final Dio _dio;

  Future<List<CouponModel>> coupons() async =>
      _list((await _dio.get<List<dynamic>>(CouponAdminFakeApi.coupons)).data);

  /// `null` when the code is already taken.
  Future<List<CouponModel>?> create(Coupon coupon) async {
    final response = await _dio.post<List<dynamic>>(
      CouponAdminFakeApi.create,
      data: CouponModel(
        code: coupon.code,
        kind: coupon.kind,
        value: coupon.value,
        minOrderBdt: coupon.minOrderBdt,
        maxDiscountBdt: coupon.maxDiscountBdt,
        expiresAt: coupon.expiresAt,
      ).toJson(),
    );
    final data = response.data;
    return data == null ? null : _list(data);
  }

  List<CouponModel> _list(List<dynamic>? data) => [
    for (final json in data ?? const [])
      CouponModel.fromJson(json as Map<String, dynamic>),
  ];
}

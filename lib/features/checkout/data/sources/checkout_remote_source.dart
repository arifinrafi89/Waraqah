import 'package:dio/dio.dart';

import '../../domain/repositories/checkout_repository.dart';
import '../models/coupon_model.dart';
import '../models/order_receipt_model.dart';
import '../models/saved_address_model.dart';
import 'checkout_fake_api.dart';

/// Talks to the checkout endpoints, answered for now by the fake API.
class CheckoutRemoteSource {
  CheckoutRemoteSource(this._dio);

  final Dio _dio;

  Future<List<SavedAddressModel>> addresses() async {
    final response = await _dio.get<List<dynamic>>(CheckoutFakeApi.addresses);
    return [
      for (final json in response.data ?? const [])
        SavedAddressModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<CouponModel?> findCoupon(String code) async {
    final response = await _dio.get<Map<String, dynamic>>(
      CheckoutFakeApi.coupon,
      queryParameters: {'code': code},
    );
    final data = response.data;
    return data == null ? null : CouponModel.fromJson(data);
  }

  Future<OrderReceiptModel> placeOrder(PlaceOrderRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      CheckoutFakeApi.placeOrder,
      data: {
        'addressId': request.addressId,
        'payment': request.payment.name,
        'couponCode': ?request.couponCode,
        'usePoints': request.usePoints,
      },
    );
    final data = response.data;
    if (data == null) throw StateError('The order was not placed.');
    return OrderReceiptModel.fromJson(data);
  }
}

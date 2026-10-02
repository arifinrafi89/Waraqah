import 'package:dio/dio.dart';

import '../../domain/repositories/checkout_repository.dart';
import '../models/coupon_model.dart';
import '../models/order_receipt_model.dart';
import 'checkout_fake_api.dart';

/// Talks to the checkout endpoints, answered for now by the fake API.
class CheckoutRemoteSource {
  CheckoutRemoteSource(this._dio);

  final Dio _dio;

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
        'useWallet': request.useWallet,
        if (request.gift case final gift?)
          'gift': {
            'recipientName': gift.recipientName.trim(),
            'message': gift.message.trim(),
            'wrapped': gift.wrapped,
          },
      },
    );
    final data = response.data;
    if (data == null) throw StateError('The order was not placed.');
    return OrderReceiptModel.fromJson(data);
  }
}

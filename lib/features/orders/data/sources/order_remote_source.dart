import 'package:dio/dio.dart';

import '../../domain/entities/order_return.dart';
import '../models/order_model.dart';
import 'order_fake_api.dart';

/// Talks to the `/orders` endpoints, answered for now by the fake API.
class OrderRemoteSource {
  OrderRemoteSource(this._dio);

  final Dio _dio;

  Future<List<OrderModel>> myOrders() async {
    final response = await _dio.get<List<dynamic>>(OrderFakeApi.orders);
    return [
      for (final json in response.data ?? const [])
        OrderModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<OrderModel?> order(String number) async {
    final response = await _dio.get<Map<String, dynamic>>(
      OrderFakeApi.details,
      queryParameters: {'number': number},
    );
    final data = response.data;
    return data == null ? null : OrderModel.fromJson(data);
  }

  Future<OrderModel> cancel(String number) =>
      _change(OrderFakeApi.cancel, {'number': number});

  Future<OrderModel> requestReturn(
    String number,
    ReturnReason reason,
    String note,
  ) => _change(OrderFakeApi.requestReturn, {
    'number': number,
    'reason': reason.name,
    'note': note,
  });

  /// The server answers `null` when the change isn't allowed any more (say,
  /// the order shipped while the page was open).
  Future<OrderModel> _change(String path, Map<String, Object> body) async {
    final response = await _dio.post<Map<String, dynamic>>(path, data: body);
    final data = response.data;
    if (data == null) throw StateError('The order could not be changed.');
    return OrderModel.fromJson(data);
  }
}

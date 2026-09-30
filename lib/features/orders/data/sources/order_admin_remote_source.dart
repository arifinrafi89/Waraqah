import 'package:dio/dio.dart';

import '../../domain/entities/order_status.dart';
import '../models/order_model.dart';
import 'order_admin_fake_api.dart';

/// Talks to the `/admin/orders` endpoints, answered for now by the fake API.
class OrderAdminRemoteSource {
  OrderAdminRemoteSource(this._dio);

  final Dio _dio;

  Future<List<OrderModel>> allOrders() async {
    final response = await _dio.get<List<dynamic>>(OrderAdminFakeApi.orders);
    return [
      for (final json in response.data ?? const [])
        OrderModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<OrderModel> advance(String number, OrderStatus next) => _change(
    OrderAdminFakeApi.advance,
    {'number': number, 'status': next.name},
  );

  Future<OrderModel> decideReturn(String number, bool approve) => _change(
    OrderAdminFakeApi.decideReturn,
    {'number': number, 'approve': approve},
  );

  /// The server answers `null` when someone else changed the order first.
  Future<OrderModel> _change(String path, Map<String, Object> body) async {
    final response = await _dio.post<Map<String, dynamic>>(path, data: body);
    final data = response.data;
    if (data == null) throw StateError('The order changed in the meantime.');
    return OrderModel.fromJson(data);
  }
}

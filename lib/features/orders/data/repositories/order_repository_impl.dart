import '../../domain/entities/order.dart';
import '../../domain/entities/order_return.dart';
import '../../domain/repositories/order_repository.dart';
import '../models/order_model.dart';
import '../sources/order_remote_source.dart';

/// No cache: an order's status can change at any time.
class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._source);

  final OrderRemoteSource _source;

  @override
  Future<List<Order>> myOrders() async => [
    for (final order in await _source.myOrders()) order.toEntity(),
  ];

  @override
  Future<Order?> order(String number) async =>
      (await _source.order(number))?.toEntity();

  @override
  Future<Order> cancel(String number) async =>
      (await _source.cancel(number)).toEntity();

  @override
  Future<Order> requestReturn(
    String number, {
    required ReturnReason reason,
    required String note,
  }) async => (await _source.requestReturn(number, reason, note)).toEntity();
}

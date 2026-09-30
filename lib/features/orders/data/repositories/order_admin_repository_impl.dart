import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/repositories/order_admin_repository.dart';
import '../models/order_model.dart';
import '../sources/order_admin_remote_source.dart';

class OrderAdminRepositoryImpl implements OrderAdminRepository {
  OrderAdminRepositoryImpl(this._source);

  final OrderAdminRemoteSource _source;

  @override
  Future<List<Order>> allOrders() async => [
    for (final order in await _source.allOrders()) order.toEntity(),
  ];

  @override
  Future<Order> advance(String number, OrderStatus next) async =>
      (await _source.advance(number, next)).toEntity();

  @override
  Future<Order> decideReturn(String number, {required bool approve}) async =>
      (await _source.decideReturn(number, approve)).toEntity();
}

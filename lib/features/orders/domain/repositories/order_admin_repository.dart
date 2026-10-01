import '../entities/order.dart';
import '../entities/order_status.dart';

/// What support staff do with orders in the Admin area. Changes answer the
/// order as it is afterwards.
abstract interface class OrderAdminRepository {
  /// Every reader's orders, newest first.
  Future<List<Order>> allOrders();

  /// Moves an order to [next], its next tracking step.
  Future<Order> advance(String number, OrderStatus next);

  Future<Order> decideReturn(String number, {required bool approve});
}

import '../models/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();

  /// Adds [order] to the newest end of the list and returns the updated list.
  Future<List<Order>> addOrder(Order order);
}

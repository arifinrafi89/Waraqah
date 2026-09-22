import '../models/order.dart';

abstract class OrderRepository {
  List<Order> getOrders();

  /// Adds [order] to the newest end of the list and returns the updated list.
  List<Order> addOrder(Order order);
}

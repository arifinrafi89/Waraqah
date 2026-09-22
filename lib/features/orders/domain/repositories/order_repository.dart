import '../models/order.dart';

abstract class OrderRepository {
  List<Order> getOrders();
}

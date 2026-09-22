import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/order.dart';
import '../domain/repositories/order_repository.dart';
import 'repositories/dummy_order_repository.dart';

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => DummyOrderRepository());

class OrdersNotifier extends Notifier<List<Order>> {
  @override
  List<Order> build() => ref.watch(orderRepositoryProvider).getOrders();

  void place(Order order) {
    state = ref.read(orderRepositoryProvider).addOrder(order);
  }
}

final ordersProvider =
    NotifierProvider<OrdersNotifier, List<Order>>(OrdersNotifier.new);

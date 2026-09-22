import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/dummy_order_repository.dart';
import '../../domain/models/order.dart';
import '../../domain/repositories/order_repository.dart';

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => DummyOrderRepository());

final ordersProvider = StateProvider<List<Order>>(
  (ref) => ref.watch(orderRepositoryProvider).getOrders(),
);

void placeOrder(WidgetRef ref, Order order) {
  ref.read(ordersProvider.notifier).state = [order, ...ref.read(ordersProvider)];
}

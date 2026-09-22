import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/order.dart';
import '../domain/repositories/order_repository.dart';
import 'repositories/dummy_order_repository.dart';

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => DummyOrderRepository());

class OrdersNotifier extends AsyncNotifier<List<Order>> {
  @override
  Future<List<Order>> build() => ref.watch(orderRepositoryProvider).getOrders();

  Future<void> place(Order order) async {
    final repository = ref.read(orderRepositoryProvider);
    state = AsyncValue.data(await repository.addOrder(order));
  }
}

final ordersProvider =
    AsyncNotifierProvider<OrdersNotifier, List<Order>>(OrdersNotifier.new);

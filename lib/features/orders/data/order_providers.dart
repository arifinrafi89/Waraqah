import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/order.dart';
import '../domain/repositories/order_repository.dart';
import 'repositories/dummy_order_repository.dart';

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => DummyOrderRepository());

final ordersProvider = StateProvider<List<Order>>(
  (ref) => ref.watch(orderRepositoryProvider).getOrders(),
);

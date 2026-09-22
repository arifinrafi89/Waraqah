import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/order_providers.dart';
import '../../domain/models/order.dart';

void placeOrder(WidgetRef ref, Order order) {
  ref.read(ordersProvider.notifier).state = [order, ...ref.read(ordersProvider)];
}

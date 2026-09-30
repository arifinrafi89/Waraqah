import 'dart:typed_data';

import '../entities/order.dart';
import '../entities/order_return.dart';

/// The reader's orders. Changes answer the order as it is afterwards.
abstract interface class OrderRepository {
  /// Newest first.
  Future<List<Order>> myOrders();

  /// `null` when there's no order with that number.
  Future<Order?> order(String number);

  Future<Order> cancel(String number);

  Future<Order> requestReturn(
    String number, {
    required ReturnReason reason,
    required String note,
    List<Uint8List> photos,
  });
}

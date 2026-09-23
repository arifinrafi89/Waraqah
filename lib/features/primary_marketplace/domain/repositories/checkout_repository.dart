import '../entities/order.dart';
import '../entities/order_item.dart';

/// Repository interface for checkout and order operations.
abstract class CheckoutRepository {
  /// Processes a simulated bKash checkout.
  /// Note: PIN is ephemeral in memory only and never saved to DB or logs (REQ-3.1.8).
  Future<Order> processSimulatedBkashCheckout({
    required String bkashNumber,
    required String pin,
    required List<OrderItem> items,
  });

  /// Fetches orders placed by the current user.
  Future<List<Order>> getUserOrders();
}


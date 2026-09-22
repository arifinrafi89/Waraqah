import '../../../cart/domain/models/cart_item.dart';

enum OrderStatus { pending, shipped, delivered, cancelled }

enum PaymentMethod { cashOnDelivery, bkash, card }

class Order {
  const Order({
    required this.id,
    required this.placedAt,
    required this.items,
    required this.total,
    required this.status,
    required this.paymentMethod,
    required this.deliveryAddress,
  });

  final String id;
  final DateTime placedAt;
  final List<CartItem> items;
  final double total;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  final String deliveryAddress;
}

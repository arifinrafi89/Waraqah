import 'order_item.dart';

/// Entity representing a customer order in the Primary Marketplace.
class Order {
  final String id;
  final String userId;
  final String status; // 'pending', 'confirmed', 'delivered', 'cancelled'
  final double totalAmount;
  final String currency;
  final String paymentMethod; // 'bkash'
  final String bkashNumberMasked;
  final List<OrderItem> items;
  final DateTime? confirmedAt;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    this.currency = 'BDT',
    this.paymentMethod = 'bkash',
    required this.bkashNumberMasked,
    this.items = const [],
    this.confirmedAt,
    required this.createdAt,
  });

  bool get isConfirmed => status.toLowerCase() == 'confirmed';
  String get formattedTotal => '৳${totalAmount.toStringAsFixed(0)}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId;

  @override
  int get hashCode => id.hashCode ^ userId.hashCode;
}


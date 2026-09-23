/// Entity representing an item within a purchase order.
class OrderItem {
  final String id;
  final String? orderId;
  final String primaryListingId;
  final String bookTitle;
  final int quantity;
  final double unitPrice;
  final String format;

  const OrderItem({
    required this.id,
    this.orderId,
    required this.primaryListingId,
    required this.bookTitle,
    this.quantity = 1,
    required this.unitPrice,
    required this.format,
  });

  double get totalPrice => unitPrice * quantity;

  String get formattedPrice => '৳${totalPrice.toStringAsFixed(0)}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          primaryListingId == other.primaryListingId;

  @override
  int get hashCode => id.hashCode ^ primaryListingId.hashCode;
}


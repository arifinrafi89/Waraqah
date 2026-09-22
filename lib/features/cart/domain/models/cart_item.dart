class CartItem {
  const CartItem({required this.bookId, required this.quantity});

  final String bookId;
  final int quantity;

  CartItem copyWith({int? quantity}) =>
      CartItem(bookId: bookId, quantity: quantity ?? this.quantity);
}

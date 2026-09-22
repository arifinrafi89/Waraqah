import '../../../../core/models/book.dart';

class CartItem {
  const CartItem({required this.bookId, required this.quantity});

  final String bookId;
  final int quantity;

  CartItem copyWith({int? quantity}) =>
      CartItem(bookId: bookId, quantity: quantity ?? this.quantity);
}

/// Flat delivery fee applied to every order. Dummy data — there is no delivery
/// pricing backend yet (ADR-0001). Cart and Checkout both read this so the two
/// screens can never show different totals.
const deliveryFee = 60.0;

/// A cart line joined to its book, with the line's money already computed.
/// A view-model, not a table — the real schema stores `cart_items` and `books`
/// separately (ADR-0001).
class CartItemTotal {
  const CartItemTotal({required this.item, required this.book});

  final CartItem item;
  final Book book;

  double get lineTotal => book.price * item.quantity;
}

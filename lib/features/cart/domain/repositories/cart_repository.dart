import '../entities/cart.dart';
import '../entities/cart_item_ref.dart';

/// The reader's cart, kept by the server. Every call answers the whole cart.
abstract interface class CartRepository {
  Future<Cart> fetch();

  /// Adds one copy; the server caps it at the line's most-per-order.
  Future<Cart> add(CartItemRef item);

  Future<Cart> setQuantity(String lineId, int quantity);

  Future<Cart> remove(String lineId);
}

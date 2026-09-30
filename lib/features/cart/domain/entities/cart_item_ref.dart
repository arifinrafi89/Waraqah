import 'cart_line.dart';

/// Something to put in the cart. Any page builds one of these and hands it to
/// `ref.addToCart(...)`; the cart looks up the title and price itself.
class CartItemRef {
  const CartItemRef.edition(this.id) : kind = CartItemKind.edition;

  const CartItemRef.certifiedUsed(this.id) : kind = CartItemKind.certifiedUsed;

  const CartItemRef.listing(this.id) : kind = CartItemKind.listing;

  const CartItemRef.bundle(this.id) : kind = CartItemKind.bundle;

  final CartItemKind kind;
  final String id;
}

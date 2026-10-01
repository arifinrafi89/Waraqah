// The fake backend fills the same cart the cart feature reads.
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/data/sources/cart_fake_store.dart';
import '../../../cart/domain/entities/cart_line.dart';
import '../models/order_model.dart';
import '../models/reorder_result_model.dart';

/// "Buy again" on the fake backend: each Edition in [order] goes back in
/// the [cart] in the same quantity, as far as stock and the cart's limits
/// allow. Used copies and bundles can't be bought again.
ReorderResultModel reorderInto(OrderModel order, CartFakeStore cart) {
  var added = 0;
  var skipped = 0;
  for (final line in order.lines) {
    final editionId = line.editionId;
    if (editionId == null) {
      skipped += line.quantity;
      continue;
    }
    for (var i = 0; i < line.quantity; i++) {
      cart.add(CartItemKind.edition.name, editionId);
    }
    final inCart = CartModel.fromJson(cart.toJson()).lines
        .any((l) => l.kind == CartItemKind.edition && l.itemId == editionId);
    if (inCart) {
      added += line.quantity;
    } else {
      skipped += line.quantity;
    }
  }
  return ReorderResultModel(added: added, skipped: skipped);
}

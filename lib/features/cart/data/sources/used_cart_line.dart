import '../../../../core/models/book.dart';
// The fake backend sees Waraqah's used stock, like the real server will.
import '../../../catalog/data/sources/used_options_fixtures.dart';
import '../../domain/entities/cart_line.dart';
import '../models/cart_model.dart';

/// A cart line for one Certified Used copy, or `null` if there's no such
/// copy. Readers' listings aren't sold through the cart: buyers make an
/// offer to the seller instead. A used copy is one of a kind, so at most
/// one fits in the cart; its "list price" is the book new, so the cart
/// shows what buying used saves.
CartLineModel? usedCartLine(CartItemKind kind, String copyId) {
  if (kind != CartItemKind.certifiedUsed) return null;
  final found = UsedOptionsFixtures.copy(copyId);
  if (found == null) return null;
  final (book, copy) = found;
  return CartLineModel(
    id: '${kind.name}-$copyId',
    kind: kind,
    itemId: copyId,
    bookId: book.id,
    title: book.title,
    author: book.author,
    unitPriceBdt: copy.priceBdt,
    listPriceBdt: book.fromPriceBdt,
    quantity: 1,
    maxQuantity: 1,
    condition: copy.condition,
    coverSeed: book.coverSeed,
  );
}

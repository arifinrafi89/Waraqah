// The fake backend sees the used copies, like the real server will.
import '../../../../core/models/book.dart';
import '../../../catalog/data/sources/used_options_fixtures.dart';
import '../../domain/entities/cart_line.dart';
import '../models/cart_model.dart';

/// A cart line for one used copy (Certified Used or a reader's listing), or
/// `null` if there's no such copy. A used copy is one of a kind, so at most
/// one fits in the cart; its "list price" is the book new, so the cart shows
/// what buying used saves.
CartLineModel? usedCartLine(CartItemKind kind, String copyId) {
  final found = UsedOptionsFixtures.copy(copyId);
  if (found == null) return null;
  final (book, copy) = found;
  final isCertified = copy.sellerName == null;
  if (isCertified != (kind == CartItemKind.certifiedUsed)) return null;
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

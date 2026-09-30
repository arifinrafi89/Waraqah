// The fake backend sees the offers, like the real server will.
import '../../../offers/data/sources/offers_fake_store.dart';
import '../../domain/entities/cart_line.dart';
import '../models/cart_model.dart';

/// A cart line for a bundle: one line at the bundle price, its "list
/// price" the books bought one by one, so the cart shows the saving.
/// `null` if there's no such bundle.
CartLineModel? bundleCartLine(OffersFakeStore? offers, String bundleId) {
  final bundle = offers?.bundle(bundleId);
  if (bundle == null || bundle.items.isEmpty) return null;
  final first = bundle.items.first;
  return CartLineModel(
    id: '${CartItemKind.bundle.name}-$bundleId',
    kind: CartItemKind.bundle,
    itemId: bundleId,
    bookId: first.bookId,
    title: bundle.title,
    author: [for (final item in bundle.items) item.title].join(' · '),
    unitPriceBdt: bundle.priceBdt,
    listPriceBdt: bundle.items.fold<int>(
      0,
      (sum, item) => sum + item.regularPriceBdt,
    ),
    quantity: 1,
    maxQuantity: 5,
    coverSeed: first.coverSeed,
  );
}

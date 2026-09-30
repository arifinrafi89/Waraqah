import 'dart:math';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../domain/entities/cart_line.dart';
import '../models/cart_model.dart';

/// The cart the fake backend keeps in memory, with the server's rules: one
/// line per item, quantities capped per order, nothing unorderable.
class CartFakeStore {
  /// Most copies of one printed Edition per order, however much is in stock.
  static const int perOrderCap = 10;

  final List<CartLineModel> _lines = [];

  Map<String, dynamic> toJson() => CartModel(lines: List.of(_lines)).toJson();

  void add(String kind, String itemId) {
    final index = _lines.indexWhere(
      (line) => line.kind.name == kind && line.itemId == itemId,
    );
    if (index >= 0) {
      final line = _lines[index];
      _lines[index] = line.copyWith(
        quantity: min(line.quantity + 1, line.maxQuantity),
      );
      return;
    }
    // Certified Used copies and Listings join here once their fake APIs exist.
    final line = kind == CartItemKind.edition.name
        ? _editionLine(itemId)
        : null;
    if (line != null) _lines.add(line);
  }

  void setQuantity(String lineId, int quantity) {
    final index = _lines.indexWhere((line) => line.id == lineId);
    if (index < 0) return;
    final line = _lines[index];
    _lines[index] = line.copyWith(
      quantity: quantity.clamp(1, line.maxQuantity),
    );
  }

  void remove(String lineId) => _lines.removeWhere((line) => line.id == lineId);

  /// Placing an order empties the cart.
  void clear() => _lines.clear();

  static CartLineModel? _editionLine(String editionId) {
    for (final book in BookFixtures.all) {
      for (final edition in book.editions) {
        if (edition.id != editionId) continue;
        return edition.isOrderable ? _line(book, edition) : null;
      }
    }
    return null;
  }

  static CartLineModel _line(Book book, Edition edition) => CartLineModel(
    id: '${CartItemKind.edition.name}-${edition.id}',
    kind: CartItemKind.edition,
    itemId: edition.id,
    bookId: book.id,
    title: book.title,
    author: book.author,
    unitPriceBdt: edition.priceBdt,
    listPriceBdt: edition.listPriceBdt,
    quantity: 1,
    maxQuantity: maxFor(edition),
    format: edition.format,
    language: edition.language,
    isPreorder: edition.stock == 0 && edition.isPreorder,
    coverSeed: book.coverSeed,
  );

  /// One copy of an eBook is enough; printed books cap at stock, or at
  /// [perOrderCap] for pre-orders.
  static int maxFor(Edition edition) {
    if (edition.format == BookFormat.ebook) return 1;
    return edition.stock > 0 ? min(edition.stock, perOrderCap) : perOrderCap;
  }
}

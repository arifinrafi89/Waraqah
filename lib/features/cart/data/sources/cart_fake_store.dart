import 'dart:math';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../domain/entities/cart_line.dart';
import '../models/cart_model.dart';
import '../../../offers/data/sources/offers_fake_store.dart';
import 'bundle_cart_line.dart';
import 'used_cart_line.dart';

/// The cart the fake backend keeps in memory, with the server's rules: one
/// line per item, quantities capped per order, nothing unorderable.
class CartFakeStore {
  /// With [offers], flash-sale prices apply and bundles can be added.
  // ignore: prefer_initializing_formals
  CartFakeStore({OffersFakeStore? offers}) : _offers = offers;

  final OffersFakeStore? _offers;

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
    final itemKind = CartItemKind.values.asNameMap()[kind];
    final line = switch (itemKind) {
      null => null,
      CartItemKind.edition => _editionLine(itemId),
      CartItemKind.bundle => bundleCartLine(_offers, itemId),
      _ => usedCartLine(itemKind, itemId),
    };
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

  CartLineModel? _editionLine(String editionId) {
    for (final book in BookFixtures.all) {
      for (final edition in book.editions) {
        if (edition.id != editionId) continue;
        return edition.isOrderable ? _line(book, edition) : null;
      }
    }
    return null;
  }

  /// A flash-sale price counts against the usual price.
  CartLineModel _line(Book book, Edition edition) {
    final flash = _offers?.flashPrice(edition.id);
    return _plainLine(book, edition).copyWith(
      unitPriceBdt: flash ?? edition.priceBdt,
      listPriceBdt: flash == null ? edition.listPriceBdt : edition.priceBdt,
    );
  }

  static CartLineModel _plainLine(Book book, Edition edition) => CartLineModel(
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

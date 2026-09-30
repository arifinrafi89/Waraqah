import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';

part 'cart_line.freezed.dart';

/// What a cart line points at: a new Edition today; Certified Used copies and
/// readers' Listings plug in when the second-hand side is built.
enum CartItemKind { edition, certifiedUsed, listing }

/// One row in the cart: what it is, how many, and what it costs right now.
@freezed
abstract class CartLine with _$CartLine {
  const factory CartLine({
    required String id,
    required CartItemKind kind,
    required String itemId,
    required String bookId,
    required String title,
    required String author,
    required int unitPriceBdt,
    required int quantity,

    /// The most one order may hold: 1 for eBooks, capped by stock otherwise.
    required int maxQuantity,
    int? listPriceBdt,
    BookFormat? format,
    BookLanguage? language,
    @Default(false) bool isPreorder,
    @Default(0) int coverSeed,
  }) = _CartLine;
}

extension CartLineX on CartLine {
  int get totalBdt => unitPriceBdt * quantity;

  /// What the reader saves against the list price, for this whole line.
  int get savingsBdt {
    final list = listPriceBdt;
    return list == null || list <= unitPriceBdt
        ? 0
        : (list - unitPriceBdt) * quantity;
  }

  bool get canAddMore => quantity < maxQuantity;
}

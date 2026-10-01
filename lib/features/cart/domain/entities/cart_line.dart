import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';

part 'cart_line.freezed.dart';

/// What a cart line points at: a new Edition, a used copy (Certified Used or
/// a reader's Listing), or a bundle of new books.
enum CartItemKind { edition, certifiedUsed, listing, bundle }

extension CartItemKindX on CartItemKind {
  bool get isUsed =>
      this == CartItemKind.certifiedUsed || this == CartItemKind.listing;
}

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

    /// Set for used copies.
    BookCondition? condition,
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

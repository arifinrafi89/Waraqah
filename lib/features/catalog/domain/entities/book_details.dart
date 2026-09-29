import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_review.dart';
import 'vendor_offer.dart';

part 'book_details.freezed.dart';
part 'book_details.g.dart';

/// Everything the detail page shows beyond the catalog's [Book] summary.
///
/// Kept separate from `Book` so the list screens stay light and the shared
/// core model does not change.
@freezed
abstract class BookDetails with _$BookDetails {
  const factory BookDetails({
    required String bookId,
    required List<VendorOffer> offers,
    @Default(<BookReview>[]) List<BookReview> reviews,
    String? description,
    int? pages,
    String? language,
    String? publisher,
  }) = _BookDetails;

  factory BookDetails.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsFromJson(json);
}

extension BookDetailsX on BookDetails {
  /// Offers in stock, cheapest first. The repository already sorts them.
  VendorOffer? get bestOffer =>
      offers.where((offer) => offer.inStock).firstOrNull;

  /// How much the best in-stock offer saves over the most expensive one.
  int get savingsBdt {
    final best = bestOffer;
    if (best == null || offers.length < 2) return 0;
    final highest = offers
        .map((offer) => offer.priceBdt)
        .reduce((a, b) => a > b ? a : b);
    return highest - best.priceBdt;
  }
}

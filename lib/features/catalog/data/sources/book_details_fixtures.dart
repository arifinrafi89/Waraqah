import '../../domain/entities/book_details.dart';
import 'seed/about_seed.dart';
import 'seed/offer_seed.dart';
import 'seed/review_seed.dart';

/// Assembles [BookDetails] from the three seed tables.
abstract final class BookDetailsFixtures {
  /// `null` when the seed has no offers for [bookId].
  static BookDetails? find(String bookId) {
    final offers = OfferSeed.byBookId[bookId];
    if (offers == null) return null;
    final about = AboutSeed.byBookId[bookId];
    return BookDetails(
      bookId: bookId,
      offers: offers,
      reviews: ReviewSeed.byBookId[bookId] ?? const [],
      description: about?.$1,
      pages: about?.$2,
      language: about?.$3,
      publisher: about?.$4,
    );
  }
}

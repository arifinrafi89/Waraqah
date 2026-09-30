import '../../domain/entities/book_details.dart';
import 'seed/about_seed.dart';
import 'seed/review_seed.dart';

/// Assembles [BookDetails] from the two seed tables.
abstract final class BookDetailsFixtures {
  /// `null` when the seed has no about or review seed for [bookId].
  static BookDetails? find(String bookId) {
    final about = AboutSeed.byBookId[bookId];
    final reviews = ReviewSeed.byBookId[bookId];
    if (about == null && reviews == null) return null;
    return BookDetails(
      bookId: bookId,
      reviews: reviews ?? const [],
      description: about?.$1,
      pages: about?.$2,
      publisher: about?.$3,
    );
  }
}

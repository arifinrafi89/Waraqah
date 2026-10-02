import '../../domain/entities/book_details.dart';
import 'seed/about_seed.dart';

/// Assembles [BookDetails] from the about seed.
abstract final class BookDetailsFixtures {
  /// `null` when the seed has nothing about [bookId].
  static BookDetails? find(String bookId) {
    final about = AboutSeed.byBookId[bookId];
    if (about == null) return null;
    return BookDetails(bookId: bookId, description: about.$1, pages: about.$2);
  }
}

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
// The fake backend buys back what's in the catalog, like the server will.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../models/sell_back_model.dart';

/// Catalog Books Waraqah buys back: printed ones, priced from the
/// cheapest printed Edition.
abstract final class SellBackBooks {
  static SellBackBookModel? _of(Book book) {
    final printed = book.editions.where((e) => e.format != BookFormat.ebook);
    if (printed.isEmpty) return null;
    return SellBackBookModel(
      bookId: book.id,
      title: book.title,
      author: book.author,
      newPriceBdt: printed
          .map((e) => e.priceBdt)
          .reduce((a, b) => a < b ? a : b),
      coverSeed: book.coverSeed,
    );
  }

  static SellBackBookModel? find(String bookId) =>
      switch (BookFixtures.all.where((b) => b.id == bookId).firstOrNull) {
        final book? => _of(book),
        null => null,
      };

  /// Up to eight Books whose title or author contains [query].
  static List<SellBackBookModel> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.length < 2) return const [];
    return [
      for (final book in BookFixtures.all)
        if (book.title.toLowerCase().contains(q) ||
            book.author.toLowerCase().contains(q))
          ?_of(book),
    ].take(8).toList();
  }
}

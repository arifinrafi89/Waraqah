import '../../../../core/models/book.dart';
import 'author_fixtures.dart';
import 'publisher_fixtures.dart';

/// Fake-API search: which Books match a query, best match first.
abstract final class BookSearchMatch {
  /// Books in [books] matching [query] (trimmed, lower-case), ranked: title
  /// starts with it, title contains it, Author, Publisher, ISBN (a full
  /// ISBN-13, hyphens and spaces ignored; partial ISBNs never match). Ties go to the
  /// higher rating, then the newer `addedAt`.
  static List<Book> rank(Iterable<Book> books, String query) {
    final ranked = <(int, Book)>[];
    for (final book in books) {
      final rank = _rank(book, query);
      if (rank != null) ranked.add((rank, book));
    }
    ranked.sort((a, b) {
      final byRank = a.$1.compareTo(b.$1);
      if (byRank != 0) return byRank;
      final byRating = b.$2.rating.compareTo(a.$2.rating);
      return byRating != 0 ? byRating : b.$2.addedAt.compareTo(a.$2.addedAt);
    });
    return [for (final (_, book) in ranked) book];
  }

  static int? _rank(Book book, String query) {
    final title = book.title.toLowerCase();
    if (title.startsWith(query)) return 0;
    if (title.contains(query)) return 1;
    final author = AuthorFixtures.all
        .where((a) => a.id == book.authorId)
        .firstOrNull;
    if (_any([book.author, author?.name, author?.nameBn], query)) return 2;
    final publisher = PublisherFixtures.all
        .where((p) => p.id == book.publisherId)
        .firstOrNull;
    if (_any([publisher?.name, publisher?.nameBn], query)) return 3;
    final isbn = query.replaceAll(RegExp(r'[\s-]'), '');
    if (RegExp(r'^\d{13}$').hasMatch(isbn) &&
        book.editions.any((e) => e.isbn == isbn)) {
      return 4;
    }
    return null;
  }

  static bool _any(List<String?> names, String query) =>
      names.any((name) => name != null && name.toLowerCase().contains(query));
}

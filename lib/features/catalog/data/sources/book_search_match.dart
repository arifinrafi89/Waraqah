import '../../../../core/models/book.dart';
import 'author_fixtures.dart';
import 'phonetic_key.dart';
import 'publisher_fixtures.dart';

/// Fake-API search: which Books match a query, best match first.
abstract final class BookSearchMatch {
  /// Books in [books] matching [query] (trimmed, lower-case), ranked: title
  /// (or Bangla title) starts with it, title contains it, Author, Publisher,
  /// ISBN (a full ISBN-13, hyphens and spaces ignored; partial ISBNs never
  /// match). A Book with no exact hit can still match by [PhoneticKey]: title
  /// 1, Author 2, Publisher 3. Ties go to the higher rating, then the newer
  /// `addedAt`.
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
    final titles = [book.title, book.titleBn];
    if (titles.any((t) => t?.toLowerCase().startsWith(query) ?? false)) {
      return 0;
    }
    if (_any(titles, query)) return 1;
    final author = AuthorFixtures.all
        .where((a) => a.id == book.authorId)
        .firstOrNull;
    final authors = [book.author, author?.name, author?.nameBn];
    if (_any(authors, query)) return 2;
    final publisher = PublisherFixtures.all
        .where((p) => p.id == book.publisherId)
        .firstOrNull;
    final publishers = [publisher?.name, publisher?.nameBn];
    if (_any(publishers, query)) return 3;
    final isbn = query.replaceAll(RegExp(r'[\s-]'), '');
    if (RegExp(r'^\d{13}$').hasMatch(isbn) &&
        book.editions.any((e) => e.isbn == isbn)) {
      return 4;
    }
    // Keys under 3 letters ("the" is `t`) would match half the catalog.
    final sound = key(query);
    if (sound.length < 3) return null;
    if (_sounds([...titles, book.shortTitle], sound)) return 1;
    if (_sounds(authors, sound)) return 2;
    if (_sounds(publishers, sound)) return 3;
    return null;
  }

  static bool _any(List<String?> names, String query) =>
      names.any((name) => name != null && name.toLowerCase().contains(query));

  /// Whether a word in one of [names] starts with the key [sound].
  static bool _sounds(List<String?> names, String sound) =>
      names.any((name) => name != null && ' ${key(name)}'.contains(' $sound'));

  /// [PhoneticKey.of], remembered per text. Keyed on the text itself, so an
  /// edited title gets a fresh key.
  // ponytail: unbounded memo; fine for the fixture catalog.
  static String key(String text) =>
      _keys.putIfAbsent(text, () => PhoneticKey.of(text));

  static final Map<String, String> _keys = {};
}

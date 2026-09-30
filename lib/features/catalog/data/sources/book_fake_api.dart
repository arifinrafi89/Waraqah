import 'package:dio/dio.dart';

import 'book_details_fixtures.dart';
import 'book_fixtures.dart';
import 'look_inside_fixtures.dart';
import 'publisher_fixtures.dart';
import 'series_fixtures.dart';
import 'used_options_fixtures.dart';

/// Catalog's fake endpoints: paths and fixture handlers, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class BookFakeApi {
  static const String books = '/books';

  /// One book's summary, page count and reviews: `?id=<bookId>`.
  /// Answers `null` when there's nothing extra for that book.
  static const String bookDetails = '/books/details';

  /// Certified Used and reader copies of a book, and its resale estimate:
  /// `?id=<bookId>`. Answers `null` for an unknown book.
  static const String usedOptions = '/books/used-options';

  /// Table of contents and sample pages: `?id=<bookId>`, or `null`.
  static const String lookInside = '/books/look-inside';

  /// The series a book is in, in reading order: `?id=<bookId>`, or `null`.
  static const String series = '/books/series';

  /// One Publisher: `?id=<publisherId>`, or `null` when unknown.
  static const String publisher = '/publishers/detail';

  /// Each Edition's lowest price in the last 30 days: `?id=<bookId>`.
  static const String priceLows = '/books/price-lows';

  /// Editions that were cheaper earlier this month than they are today.
  static const Map<String, int> _earlierLows = {'bk-sapiens-pb-en': 620};

  static final Map<String, Object? Function(RequestOptions)> routes = {
    books: _books,
    bookDetails: _bookDetails,
    usedOptions: _usedOptions,
    lookInside: (options) => LookInsideFixtures.byBook[_id(options)]?.toJson(),
    series: _series,
    publisher: (options) => PublisherFixtures.all
        .where((p) => p.id == _id(options))
        .firstOrNull
        ?.toJson(),
    priceLows: (options) => {
      for (final book in BookFixtures.all.where((b) => b.id == _id(options)))
        for (final e in book.editions)
          e.id: (_earlierLows[e.id] ?? e.priceBdt) < e.priceBdt
              ? _earlierLows[e.id]!
              : e.priceBdt,
    },
  };

  static String _id(RequestOptions options) =>
      options.queryParameters['id'] as String? ?? '';

  static Object? _series(RequestOptions options) {
    final series = SeriesFixtures.forBook(_id(options));
    if (series == null) return null;
    return series
        .copyWith(
          entries: [
            for (final entry in series.entries)
              entry.copyWith(
                coverSeed:
                    BookFixtures.all
                        .where((b) => b.id == entry.bookId)
                        .firstOrNull
                        ?.coverSeed ??
                    entry.position,
              ),
          ],
        )
        .toJson();
  }

  static Object? _usedOptions(RequestOptions options) {
    final id = options.queryParameters['id'] as String? ?? '';
    final book = BookFixtures.all.where((b) => b.id == id).firstOrNull;
    return book == null ? null : UsedOptionsFixtures.forBook(book).toJson();
  }

  static Object? _bookDetails(RequestOptions options) {
    final id = options.queryParameters['id'] as String? ?? '';
    return BookDetailsFixtures.find(id)?.toJson();
  }

  static Object _books(RequestOptions options) {
    final category = options.queryParameters['category'] as String?;
    final query = (options.queryParameters['q'] as String? ?? '')
        .trim()
        .toLowerCase();
    final matches = BookFixtures.all.where((book) {
      final matchesCategory = category == null || book.categoryId == category;
      final matchesQuery =
          query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    });
    return matches.map((book) => book.toJson()).toList();
  }
}

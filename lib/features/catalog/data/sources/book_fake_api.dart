import 'package:dio/dio.dart';

import 'author_fixtures.dart';
import 'book_details_fixtures.dart';
import 'book_fixtures.dart';
import 'category_fixtures.dart';
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

  /// A Section's Categories: `?section=<section>`.
  static const String categories = '/categories';

  /// One Author: `?id=<authorId>`, or `null` when unknown.
  static const String author = '/authors/detail';

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
    series: (options) => SeriesFixtures.jsonForBook(_id(options)),
    categories: (options) => CategoryFixtures.forSection(
      options.queryParameters['section'] as String?,
    ),
    author: (options) => AuthorFixtures.all
        .where((a) => a.id == _id(options))
        .firstOrNull
        ?.toJson(),
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

  static Object? _usedOptions(RequestOptions options) {
    final book = BookFixtures.all
        .where((b) => b.id == _id(options))
        .firstOrNull;
    return book == null ? null : UsedOptionsFixtures.forBook(book).toJson();
  }

  static Object? _bookDetails(RequestOptions options) {
    return BookDetailsFixtures.find(_id(options))?.toJson();
  }

  static Object _books(RequestOptions options) {
    final category = options.queryParameters['category'] as String?;
    final section = options.queryParameters['section'] as String?;
    final author = options.queryParameters['author'] as String?;
    final publisher = options.queryParameters['publisher'] as String?;
    final query = (options.queryParameters['q'] as String? ?? '')
        .trim()
        .toLowerCase();
    final matches = BookFixtures.all.where((book) {
      final matchesCategory = category == null || book.categoryId == category;
      final matchesSection = section == null || book.section.name == section;
      final matchesAuthor = author == null || book.authorId == author;
      final matchesPublisher =
          publisher == null || book.publisherId == publisher;
      final matchesQuery =
          query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory &&
          matchesSection &&
          matchesAuthor &&
          matchesPublisher &&
          matchesQuery;
    });
    return matches.map((book) => book.toJson()).toList();
  }
}

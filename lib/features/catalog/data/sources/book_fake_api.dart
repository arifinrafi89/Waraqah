import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import 'author_fixtures.dart';
import 'book_details_fixtures.dart';
import 'book_edition_filter.dart';
import 'book_fixtures.dart';
import 'book_search_match.dart';
import 'book_sort.dart';
import 'category_fixtures.dart';
import 'look_inside_fixtures.dart';
import 'publisher_fixtures.dart';
import 'series_fixtures.dart';
import 'subject_fixtures.dart';
import 'used_options_fixtures.dart';

/// Catalog's fake endpoints, merged in by `app/fake_api_routes.dart`.
abstract final class BookFakeApi {
  /// Books on the storefront, narrowed by the query. Hidden Books only with
  /// `includeHidden=true` (Staff's list).
  static const String books = '/books';

  /// One Book, even a hidden one: `?id=<bookId>`, or `null` when unknown.
  static const String book = '/books/detail';

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

  /// One Series: `?id=<seriesId>`, or `null` when unknown.
  static const String seriesDetail = '/series/detail';

  /// A Section's Categories: `?section=<section>`.
  static const String categories = '/categories';

  /// Every Subject, or only those with Books in `?section=<section>`.
  static const String subjects = '/subjects';

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
    book: (options) => _book(options)?.toJson(),
    bookDetails: (options) => BookDetailsFixtures.find(_id(options))?.toJson(),
    usedOptions: (options) => switch (_book(options)) {
      final book? => UsedOptionsFixtures.forBook(book).toJson(),
      null => null,
    },
    lookInside: (options) => LookInsideFixtures.byBook[_id(options)]?.toJson(),
    series: (options) => SeriesFixtures.jsonForBook(_id(options)),
    seriesDetail: (options) => SeriesFixtures.jsonForId(_id(options)),
    categories: (options) => CategoryFixtures.forSection(_section(options)),
    subjects: (options) => SubjectFixtures.forSection(_section(options)),
    author: (options) =>
        _byId(AuthorFixtures.all, (a) => a.id, options)?.toJson(),
    publisher: (options) =>
        _byId(PublisherFixtures.all, (p) => p.id, options)?.toJson(),
    priceLows: (options) => {
      for (final e in _book(options)?.editions ?? const <Edition>[])
        e.id: (_earlierLows[e.id] ?? e.priceBdt) < e.priceBdt
            ? _earlierLows[e.id]!
            : e.priceBdt,
    },
  };

  static String _id(RequestOptions options) =>
      options.queryParameters['id'] as String? ?? '';

  static T? _byId<T>(List<T> all, String Function(T) id, RequestOptions o) =>
      all.where((x) => id(x) == _id(o)).firstOrNull;

  static String? _section(RequestOptions options) =>
      options.queryParameters['section'] as String?;

  static Book? _book(RequestOptions options) =>
      BookFixtures.all.where((b) => b.id == _id(options)).firstOrNull;

  static Object _books(RequestOptions options) {
    final params = options.queryParameters;
    final query = (params['q'] as String? ?? '').trim().toLowerCase();
    final withHidden = params['includeHidden'] == true;
    bool inScope(Book book) =>
        (withHidden || !book.hidden) &&
        (params['category'] == null || book.categoryId == params['category']) &&
        (params['section'] == null || book.section.name == params['section']) &&
        (params['author'] == null || book.authorId == params['author']) &&
        (params['publisher'] == null ||
            book.publisherId == params['publisher']);
    final matches = BookEditionFilter.apply(
      BookFixtures.all,
      params,
    ).where(inScope);
    final found = query.isEmpty
        ? matches.toList()
        : BookSearchMatch.rank(matches, query);
    final sort = params['sort'] as String?;
    return BookSort.apply(found, sort).map((book) => book.toJson()).toList();
  }
}

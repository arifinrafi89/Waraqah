import 'package:dio/dio.dart';

import 'book_details_fixtures.dart';
import 'book_fixtures.dart';

/// Catalog's fake endpoints: paths and fixture handlers, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class BookFakeApi {
  static const String books = '/books';

  /// One book's summary, page count, publisher and reviews: `?id=<bookId>`.
  /// Answers `null` when there's nothing extra for that book.
  static const String bookDetails = '/books/details';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    books: _books,
    bookDetails: _bookDetails,
  };

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
      final matchesCategory =
          category == null ||
          book.category == category ||
          // ponytail: the Academic chip is a Section now; ticket 2 replaces the chips.
          book.section.name == category.toLowerCase();
      final matchesQuery =
          query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    });
    return matches.map((book) => book.toJson()).toList();
  }
}

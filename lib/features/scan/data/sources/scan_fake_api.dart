import 'package:dio/dio.dart';

// The fake backend looks ISBNs up in the whole catalog, like the server.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../../core/models/book.dart';
import '../models/scanned_book_model.dart';

/// The scanner's fake endpoint, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class ScanFakeApi {
  /// `?isbn=9789840001491`: the Book with an Edition of that ISBN, or
  /// `null` when Waraqah doesn't have it.
  static const String lookUp = '/scan/lookup';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    lookUp: (options) => _find(options.queryParameters['isbn'] as String?),
  };

  static Map<String, dynamic>? _find(String? isbn) {
    for (final book in BookFixtures.all) {
      if (!book.editions.any((e) => e.isbn == isbn)) continue;
      return ScannedBookModel(
        bookId: book.id,
        title: book.title,
        author: book.author,
        isbn: isbn!,
        coverSeed: book.coverSeed,
        newPriceBdt: book.fromPriceBdt,
      ).toJson();
    }
    return null;
  }
}

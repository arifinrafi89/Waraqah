import 'package:dio/dio.dart';

import '../../../catalog/data/sources/book_fixtures.dart';
import 'isbn_lookup_fixtures.dart';

/// Admin → Catalog's tools on the fake backend, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class CatalogToolsFakeApi {
  static const String _base = '/admin/catalog';

  /// `?isbn=<ISBN-13>` → `{inCatalog: true, bookId}` when an Edition has
  /// it, a Book from outside (`inCatalog: false`, title, author, publisher,
  /// language, format, listPriceBdt…), or `null`.
  static const String isbnLookup = '$_base/isbn-lookup';

  static Map<String, Object? Function(RequestOptions)> routes() => {
    isbnLookup: (o) => _lookUp(o.queryParameters['isbn'] as String? ?? ''),
  };

  static Map<String, Object?>? _lookUp(String isbn) {
    final book = BookFixtures.all
        .where((b) => b.editions.any((e) => e.isbn == isbn))
        .firstOrNull;
    if (book != null) return {'inCatalog': true, 'bookId': book.id};
    final found = IsbnLookupFixtures.byIsbn[isbn];
    return found == null
        ? null
        : {
            'inCatalog': false,
            'isbn': isbn,
            'language': 'english',
            'format': 'paperback',
            ...found,
          };
  }
}

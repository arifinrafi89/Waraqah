import 'package:dio/dio.dart';

import '../../../../core/models/edition.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import 'catalog_admin_fake_store.dart';
import 'catalog_import_fake.dart';
import 'isbn_lookup_fixtures.dart';

/// Admin → Catalog's tools on the fake backend, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`.
abstract final class CatalogToolsFakeApi {
  static const String _base = '/admin/catalog';

  /// `?isbn=<ISBN-13>` → `{inCatalog: true, bookId}` when an Edition has
  /// it, a Book from outside (`inCatalog: false`, title, author, publisher,
  /// language, format, listPriceBdt…), or `null`.
  static const String isbnLookup = '$_base/isbn-lookup';

  /// Printed Editions (no eBooks or pre-orders) at or under
  /// `CatalogAdminRules.lowStock`, lowest first: `{bookId, title, coverSeed,
  /// editionId, format, language, stock}`.
  static const String lowStock = '$_base/low-stock';

  /// Body `{editionId, stock}` → the same; `null` for an eBook or a
  /// negative stock.
  static const String editionStock = '$_base/editions/stock';

  /// Body `{books: [{row, author, publisher, ...BookDraft}]}` → `{imported,
  /// skipped: [{row, reason}]}`. See [CatalogImportFake.run].
  static const String importBooks = '$_base/import';

  static Map<String, Object? Function(RequestOptions)> routes(
    CatalogAdminFakeStore store,
  ) => {
    importBooks: (o) =>
        CatalogImportFake.run(store, (o.data as Map)['books'] as List),
    isbnLookup: (o) => _lookUp(o.queryParameters['isbn'] as String? ?? ''),
    lowStock: (_) => [
      for (final b in BookFixtures.all)
        for (final e in b.editions)
          if (e.format != BookFormat.ebook &&
              !e.isPreorder &&
              e.stock <= CatalogAdminRules.lowStock)
            {
              'bookId': b.id,
              'title': b.title,
              'coverSeed': b.coverSeed,
              'editionId': e.id,
              'format': e.format.name,
              'language': e.language.name,
              'stock': e.stock,
            },
    ]..sort((a, b) => (a['stock'] as int).compareTo(b['stock'] as int)),
    editionStock: (o) {
      final saved = _setStock(o.data as Map<String, dynamic>);
      if (saved != null) store.onChanged?.call();
      return saved;
    },
  };

  static Map<String, dynamic>? _setStock(Map<String, dynamic> body) {
    final stock = body['stock'] as int? ?? -1;
    for (final (i, b) in BookFixtures.all.indexed) {
      final e = b.editions.where((e) => e.id == body['editionId']).firstOrNull;
      if (e == null) continue;
      if (stock < 0 || e.format == BookFormat.ebook) return null;
      BookFixtures.all[i] = b.copyWith(
        editions: [
          for (final x in b.editions) x == e ? e.copyWith(stock: stock) : x,
        ],
      );
      return body;
    }
    return null;
  }

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

import 'package:dio/dio.dart';

import '../../../../core/models/edition.dart';
import '../../domain/entities/isbn_lookup.dart';
import '../../domain/entities/low_stock_edition.dart';
import 'catalog_tools_fake_api.dart';

/// Talks to Admin → Catalog's tool endpoints, answered for now by the fake
/// API.
class CatalogToolsRemoteSource {
  CatalogToolsRemoteSource(this._dio);

  final Dio _dio;

  /// `null` when nobody knows [isbn] (an ISBN-13).
  Future<IsbnLookup?> lookUpIsbn(String isbn) async {
    final j = (await _dio.get<Map<String, dynamic>>(
      CatalogToolsFakeApi.isbnLookup,
      queryParameters: {'isbn': isbn},
    )).data;
    if (j == null) return null;
    if (j['inCatalog'] == true) return IsbnInCatalog(j['bookId'] as String);
    return IsbnFound(
      isbn: j['isbn'] as String,
      title: j['title'] as String,
      titleBn: j['titleBn'] as String?,
      author: j['author'] as String,
      publisher: j['publisher'] as String,
      language: BookLanguage.values.byName(j['language'] as String),
      format: BookFormat.values.byName(j['format'] as String),
      listPriceBdt: j['listPriceBdt'] as int?,
    );
  }

  Future<List<LowStockEdition>> lowStock() async => [
    for (final j
        in (await _dio.get<List<dynamic>>(CatalogToolsFakeApi.lowStock)).data ??
            const [])
      (
        bookId: j['bookId'] as String,
        title: j['title'] as String,
        coverSeed: j['coverSeed'] as int,
        editionId: j['editionId'] as String,
        format: BookFormat.values.byName(j['format'] as String),
        language: BookLanguage.values.byName(j['language'] as String),
        stock: j['stock'] as int,
      ),
  ];

  /// Throws when refused.
  Future<void> setStock(String editionId, int stock) async {
    final data = (await _dio.post<dynamic>(
      CatalogToolsFakeApi.editionStock,
      data: {'editionId': editionId, 'stock': stock},
    )).data;
    if (data == null) throw StateError('The server refused the change.');
  }
}

import 'package:dio/dio.dart';

import '../../../../core/models/edition.dart';
import '../../domain/entities/isbn_lookup.dart';
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
}

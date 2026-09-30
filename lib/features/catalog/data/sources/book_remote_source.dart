import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/catalog_filters.dart';
import 'book_fake_api.dart';

/// Talks to `GET /books`. In this app that request is always answered by the
/// `FakeApiInterceptor` installed on `dioProvider` (see `app/fake_api_routes.dart`).
class BookRemoteSource {
  BookRemoteSource(this._dio);

  final Dio _dio;

  Future<List<Book>> fetchBooks([
    CatalogFilters filters = const CatalogFilters(),
  ]) async {
    final response = await _dio.get<List<dynamic>>(
      BookFakeApi.books,
      queryParameters: {
        'category': ?filters.categoryId,
        'section': ?filters.section?.name,
        'author': ?filters.authorId,
        'publisher': ?filters.publisherId,
        if (filters.query.isNotEmpty) 'q': filters.query,
        'sort': ?filters.sort?.name,
        'minPrice': ?filters.minPrice,
        'maxPrice': ?filters.maxPrice,
        if (filters.formats.isNotEmpty)
          'format': filters.formats.map((f) => f.name).join(','),
        if (filters.languages.isNotEmpty)
          'language': filters.languages.map((l) => l.name).join(','),
        'minRating': ?filters.minRating,
        if (filters.inStockOnly) 'inStock': true,
      },
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map(Book.fromJson)
        .toList();
  }
}

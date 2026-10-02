import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/catalog_filters.dart';
import 'book_fake_api.dart';
import 'book_suggest_fake_api.dart';

/// Talks to `GET /books` and `GET /books/detail`. In this app that request is always answered by the
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
        'class': ?filters.classLevel,
        'exam': ?filters.exam?.name,
        'subject': ?filters.subjectId,
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
        if (filters.includeHidden) 'includeHidden': true,
      },
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map(Book.fromJson)
        .toList();
  }

  /// One Book, even a hidden one; `null` when unknown.
  Future<Book?> fetchBook(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BookFakeApi.book,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : Book.fromJson(data);
  }

  /// Up to 5 titles and Author names for [query], in the script it's typed in.
  Future<List<String>> fetchSuggestions(String query) async {
    final response = await _dio.get<List<dynamic>>(
      BookSuggestFakeApi.suggest,
      queryParameters: {'q': query},
    );
    return (response.data ?? []).cast<String>();
  }

  /// The one title closest to [query], or `null` when none is close.
  Future<String?> fetchDidYouMean(String query) async {
    final response = await _dio.get<String>(
      BookSuggestFakeApi.didYouMean,
      queryParameters: {'q': query},
    );
    return response.data;
  }
}

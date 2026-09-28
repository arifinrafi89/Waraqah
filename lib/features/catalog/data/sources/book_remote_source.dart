import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/api_config.dart';
import 'book_fixtures.dart';

/// Talks to `GET /books` on the Go backend.
///
/// While the backend repository is still being built, a failed call falls back
/// to [BookFixtures] instead of throwing, so the UI is demoable end to end. The
/// deliberate delay lets the shimmer skeletons actually show.
class BookRemoteSource {
  BookRemoteSource(this._dio);

  final Dio _dio;

  Future<List<Book>> fetchBooks({String? category, String query = ''}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiRoutes.books,
        queryParameters: {
          'category': ?category,
          if (query.isNotEmpty) 'q': query,
        },
      );
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(Book.fromJson)
          .toList();
    } on DioException {
      return _fallback(category: category, query: query);
    }
  }

  Future<List<Book>> _fallback({String? category, String query = ''}) async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    final lower = query.trim().toLowerCase();
    return BookFixtures.all.where((book) {
      final matchesCategory = category == null || book.category == category;
      final matchesQuery =
          lower.isEmpty ||
          book.title.toLowerCase().contains(lower) ||
          book.author.toLowerCase().contains(lower);
      return matchesCategory && matchesQuery;
    }).toList();
  }
}

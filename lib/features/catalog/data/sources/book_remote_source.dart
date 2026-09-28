import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/api_config.dart';

/// Talks to `GET /books`. In this app that request is always answered by the
/// `FakeApiInterceptor` installed on `dioProvider` (see `app/fake_api_routes.dart`).
class BookRemoteSource {
  BookRemoteSource(this._dio);

  final Dio _dio;

  Future<List<Book>> fetchBooks({String? category, String query = ''}) async {
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
  }
}

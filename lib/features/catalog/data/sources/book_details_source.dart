import 'package:dio/dio.dart';

import '../../domain/entities/book_details.dart';
import 'book_fake_api.dart';

/// Talks to `GET /books/details?id=…`, answered by the `FakeApiInterceptor`
/// installed on `dioProvider` (see `app/fake_api_routes.dart`).
class BookDetailsSource {
  BookDetailsSource(this._dio);

  final Dio _dio;

  /// `null` when the API has nothing extra for [bookId].
  Future<BookDetails?> fetch(String bookId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BookFakeApi.bookDetails,
      queryParameters: {'id': bookId},
    );
    final data = response.data;
    return data == null ? null : BookDetails.fromJson(data);
  }
}

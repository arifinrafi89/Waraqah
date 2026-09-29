import 'package:dio/dio.dart';

import '../../../../core/network/api_config.dart';
import '../../domain/entities/book_details.dart';
import 'book_details_fixtures.dart';

/// Talks to `GET /books/:id/details` on the Go backend.
///
/// Same approach as [BookRemoteSource]: until the backend is deployed a failed
/// call falls back to the seed, with a short delay so the skeleton shows.
class BookDetailsSource {
  BookDetailsSource(this._dio);

  final Dio _dio;

  /// `null` when neither the API nor the seed knows [bookId].
  Future<BookDetails?> fetch(String bookId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiRoutes.books}/$bookId/details',
      );
      final data = response.data;
      return data == null ? null : BookDetails.fromJson(data);
    } on DioException {
      await Future<void>.delayed(const Duration(milliseconds: 600));
      return BookDetailsFixtures.find(bookId);
    }
  }
}

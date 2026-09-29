import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../core/network/api_config.dart';
import '../../domain/entities/book_details.dart';
import 'book_details_fixtures.dart';

/// Talks to `GET /books/:id/details` on the Go backend.
///
/// Until the backend is deployed, a failed call falls back to the seed. The
/// call also gets a short [budget]: the placeholder backend address can hang
/// on web and desktop instead of failing, and the page shouldn't sit on a
/// skeleton waiting for it. Remove the fallback once the real API is live.
class BookDetailsSource {
  BookDetailsSource(this._dio, {this.budget = const Duration(seconds: 3)});

  final Dio _dio;
  final Duration budget;

  /// `null` when neither the API nor the seed knows [bookId].
  Future<BookDetails?> fetch(String bookId) async {
    try {
      final response = await _dio
          .get<Map<String, dynamic>>('${ApiRoutes.books}/$bookId/details')
          .timeout(budget);
      final data = response.data;
      return data == null ? null : BookDetails.fromJson(data);
    } on DioException {
      // Failed fast: pause briefly so the skeleton doesn't just flash.
      await Future<void>.delayed(const Duration(milliseconds: 600));
      return BookDetailsFixtures.find(bookId);
    } on TimeoutException {
      return BookDetailsFixtures.find(bookId);
    }
  }
}

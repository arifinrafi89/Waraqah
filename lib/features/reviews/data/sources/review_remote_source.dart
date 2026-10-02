import 'package:dio/dio.dart';

import '../models/review_model.dart';
import 'review_fake_api.dart';

/// Talks to `/reviews…`, answered for now by the fake API. A refused change
/// (`null`) is an error.
class ReviewRemoteSource {
  ReviewRemoteSource(this._dio);

  final Dio _dio;

  Future<BookReviewsModel> reviews(String bookId) => _read(
    _dio.get(ReviewFakeApi.reviews, queryParameters: {'bookId': bookId}),
  );

  Future<BookReviewsModel> save(String bookId, int stars, String text) => _read(
    _dio.post(
      ReviewFakeApi.save,
      data: {'bookId': bookId, 'stars': stars, 'text': text},
    ),
  );

  Future<BookReviewsModel> delete(String bookId) =>
      _read(_dio.post(ReviewFakeApi.delete, data: {'bookId': bookId}));

  Future<BookReviewsModel> _read(
    Future<Response<Map<String, dynamic>>> request,
  ) async {
    final data = (await request).data;
    if (data == null) throw StateError('The server refused the change.');
    return BookReviewsModel.fromJson(data);
  }
}

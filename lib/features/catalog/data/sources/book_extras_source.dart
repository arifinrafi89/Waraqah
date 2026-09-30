import 'package:dio/dio.dart';

import '../models/book_extras_model.dart';
import 'book_fake_api.dart';

/// Talks to `/books/look-inside` and `/books/series`, answered for now by
/// the fake API.
class BookExtrasSource {
  BookExtrasSource(this._dio);

  final Dio _dio;

  Future<LookInsideModel?> lookInside(String bookId) async {
    final data = await _get(BookFakeApi.lookInside, bookId);
    return data == null ? null : LookInsideModel.fromJson(data);
  }

  Future<BookSeriesModel?> series(String bookId) async {
    final data = await _get(BookFakeApi.series, bookId);
    return data == null ? null : BookSeriesModel.fromJson(data);
  }

  Future<Map<String, dynamic>?> _get(String path, String bookId) async =>
      (await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: {'id': bookId},
      )).data;
}

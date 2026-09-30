import 'package:dio/dio.dart';

import '../models/used_options_model.dart';
import 'book_fake_api.dart';

/// Talks to `GET /books/used-options?id=…`, answered for now by the fake API.
class UsedOptionsSource {
  UsedOptionsSource(this._dio);

  final Dio _dio;

  Future<UsedOptionsModel> forBook(String bookId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BookFakeApi.usedOptions,
      queryParameters: {'id': bookId},
    );
    final data = response.data;
    return data == null
        ? const UsedOptionsModel()
        : UsedOptionsModel.fromJson(data);
  }
}

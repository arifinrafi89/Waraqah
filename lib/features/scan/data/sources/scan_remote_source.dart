import 'package:dio/dio.dart';

import '../models/scanned_book_model.dart';
import 'scan_fake_api.dart';

/// Talks to the `/scan` endpoint, answered for now by the fake API.
class ScanRemoteSource {
  ScanRemoteSource(this._dio);

  final Dio _dio;

  Future<ScannedBookModel?> lookUp(String isbn) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ScanFakeApi.lookUp,
      queryParameters: {'isbn': isbn},
    );
    final data = response.data;
    return data == null ? null : ScannedBookModel.fromJson(data);
  }
}

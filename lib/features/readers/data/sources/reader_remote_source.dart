import 'package:dio/dio.dart';

import '../models/reader_model.dart';
import 'reader_fake_api.dart';

/// Talks to `/readers…`, answered for now by the fake API. A refused change
/// (`null`) is an error.
class ReaderRemoteSource {
  ReaderRemoteSource(this._dio);

  final Dio _dio;

  Future<ReaderModel> reader(String id) =>
      _read(_dio.get(ReaderFakeApi.detail, queryParameters: {'id': id}));

  Future<ReaderModel> follow(String id, {required bool follow}) => _read(
    _dio.post(ReaderFakeApi.follow, data: {'id': id, 'follow': follow}),
  );

  Future<ReaderModel> _read(
    Future<Response<Map<String, dynamic>>> request,
  ) async {
    final data = (await request).data;
    if (data == null) throw StateError('The server refused the request.');
    return ReaderModel.fromJson(data);
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';

import 'handled_sale_fake_api.dart';

/// The live connection to `/sales/live`: the id of each sale that changed,
/// read a `data:` line at a time.
class SaleLiveSource {
  SaleLiveSource(this._dio);

  final Dio _dio;

  Stream<String> changes() async* {
    final response = await _dio.get<ResponseBody>(
      HandledSaleFakeApi.live,
      options: Options(
        responseType: ResponseType.stream,
        // A live connection stays open as long as the app listens.
        receiveTimeout: Duration.zero,
      ),
    );
    final body = response.data;
    if (body == null) return;
    yield* body.stream
        .cast<List<int>>()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .where((line) => line.startsWith('data:'))
        .map(
          (line) =>
              (jsonDecode(line.substring(5).trim()) as Map)['saleId'] as String,
        );
  }
}

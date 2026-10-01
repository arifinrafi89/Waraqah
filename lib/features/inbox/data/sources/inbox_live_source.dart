import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/inbox_thread_model.dart';
import 'inbox_fake_api.dart';

/// The live connection: a long-lived server-sent events response, read a
/// line at a time. Each `data:` line is one change. The fake API answers
/// it from memory; the Go backend will stream the same lines.
class InboxLiveSource {
  InboxLiveSource(this._dio);

  final Dio _dio;

  Stream<InboxChangeModel> changes() async* {
    final response = await _dio.get<ResponseBody>(
      InboxFakeApi.live,
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
          (line) => InboxChangeModel.fromJson(
            jsonDecode(line.substring(5).trim()) as Map<String, dynamic>,
          ),
        );
  }
}

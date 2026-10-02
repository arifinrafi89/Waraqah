import 'dart:convert';

import 'package:dio/dio.dart';

import 'notification_fake_api.dart';

/// The live connection: a long-lived server-sent events response, read a
/// line at a time. Each `data:` line carries the new unread count. The fake
/// API answers it from memory; the Go backend will stream the same lines.
class NotificationLiveSource {
  NotificationLiveSource(this._dio);

  final Dio _dio;

  Stream<int> unread() async* {
    final response = await _dio.get<ResponseBody>(
      NotificationFakeApi.live,
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
              (jsonDecode(line.substring(5).trim()) as Map)['unread'] as int,
        );
  }
}

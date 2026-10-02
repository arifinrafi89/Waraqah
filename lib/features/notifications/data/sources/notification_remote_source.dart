import 'package:dio/dio.dart';

import '../models/app_notification_model.dart';
import 'notification_fake_api.dart';

/// Talks to `/notifications…`, answered for now by the fake API. A refused
/// change (`null`) is an error.
class NotificationRemoteSource {
  NotificationRemoteSource(this._dio);

  final Dio _dio;

  Future<List<AppNotificationModel>> notifications() =>
      _list(_dio.get<List<dynamic>>(NotificationFakeApi.notifications));

  Future<List<AppNotificationModel>> markRead(String id) => _list(
    _dio.post<List<dynamic>>(NotificationFakeApi.read, data: {'id': id}),
  );

  Future<List<AppNotificationModel>> markAllRead() =>
      _list(_dio.post<List<dynamic>>(NotificationFakeApi.readAll));

  Future<List<AppNotificationModel>> _list(
    Future<Response<List<dynamic>>> request,
  ) async {
    final data = (await request).data;
    if (data == null) throw StateError('The server refused the change.');
    return [
      for (final json in data)
        AppNotificationModel.fromJson(json as Map<String, dynamic>),
    ];
  }
}

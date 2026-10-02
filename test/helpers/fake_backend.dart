import 'package:dio/dio.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/app/fake_stores.dart';
import 'package:waraqah/features/notifications/data/models/app_notification_model.dart';
import 'package:waraqah/features/notifications/domain/entities/notification_kind.dart';

/// A fake backend tests can look inside, with Dio on top.
class FakeBackend {
  final stores = FakeStores();
  late final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor(stores));

  Future<void> post(String path, Map<String, Object?> body) =>
      dio.post<Object?>(path, data: body);

  /// Notifications [readerId] got after the seeds.
  List<AppNotificationModel> sent(String readerId, NotificationKind kind) => [
    for (final n in stores.notifications.sentTo(readerId))
      if (n.kind == kind && !n.id.startsWith('nt-seed')) n,
  ];
}

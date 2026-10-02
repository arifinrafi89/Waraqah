import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../models/app_notification_model.dart';
import '../sources/notification_live_source.dart';
import '../sources/notification_remote_source.dart';

/// No cache: the live feed says when anything changes.
class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._source, this._live);

  final NotificationRemoteSource _source;
  final NotificationLiveSource _live;

  @override
  Future<List<AppNotification>> notifications() async =>
      _entities(await _source.notifications());

  @override
  Future<List<AppNotification>> markRead(String id) async =>
      _entities(await _source.markRead(id));

  @override
  Future<List<AppNotification>> markAllRead() async =>
      _entities(await _source.markAllRead());

  @override
  Stream<int> unreadChanges() => _live.unread();

  List<AppNotification> _entities(List<AppNotificationModel> models) => [
    for (final model in models) model.toEntity(),
  ];
}

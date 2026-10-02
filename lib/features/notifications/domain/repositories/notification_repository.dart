import '../entities/app_notification.dart';

/// The signed-in Reader's notifications, newest first. Changes answer the
/// whole list.
abstract interface class NotificationRepository {
  Future<List<AppNotification>> notifications();

  Future<List<AppNotification>> markRead(String id);

  Future<List<AppNotification>> markAllRead();

  /// The unread count, each time it changes, while the app listens.
  Stream<int> unreadChanges();
}

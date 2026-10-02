import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_kind.dart';

part 'app_notification.freezed.dart';

/// A note in the notification center that something happened to the
/// Reader. [params] fill the kind's text (order number, status, title,
/// amount…).
@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required NotificationKind kind,
    required DateTime createdAt,
    @Default(false) bool read,
    @Default(<String, String>{}) Map<String, String> params,
    NotificationTarget? target,
  }) = _AppNotification;
}

/// The page a notification opens: an order number, a Listing id, a book id…
@freezed
abstract class NotificationTarget with _$NotificationTarget {
  const factory NotificationTarget({
    required NotificationTargetKind kind,
    @Default('') String id,
  }) = _NotificationTarget;
}

enum NotificationKind { orderUpdate, listingApproved, newMessage, general }

class AppNotification {
  const AppNotification({
    required this.id,
    required this.kind,
    required this.title,
    required this.message,
    required this.createdAt,
    this.isRead = false,
  });

  final String id;
  final NotificationKind kind;
  final String title;
  final String message;
  final DateTime createdAt;
  final bool isRead;

  AppNotification copyWith({bool? isRead}) => AppNotification(
    id: id,
    kind: kind,
    title: title,
    message: message,
    createdAt: createdAt,
    isRead: isRead ?? this.isRead,
  );
}

class NotificationRequest {
  const NotificationRequest({
    required this.kind,
    required this.title,
    required this.message,
  });

  final NotificationKind kind;
  final String title;
  final String message;
}

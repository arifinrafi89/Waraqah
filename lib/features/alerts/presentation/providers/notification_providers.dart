import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/app_notification.dart';

class NotificationCenterNotifier extends Notifier<List<AppNotification>> {
  @override
  List<AppNotification> build() => [
    AppNotification(
      id: 'n-order-1',
      kind: NotificationKind.orderUpdate,
      title: 'Order on its way',
      message: 'Your order WQ-1042 has been handed to the courier.',
      createdAt: DateTime(2026, 10, 1, 10),
    ),
    AppNotification(
      id: 'n-listing-1',
      kind: NotificationKind.listingApproved,
      title: 'Listing approved',
      message: 'Your copy of The Sealed Nectar is now live.',
      createdAt: DateTime(2026, 9, 30, 18),
    ),
    AppNotification(
      id: 'n-message-1',
      kind: NotificationKind.newMessage,
      title: 'New message',
      message: 'Nadia sent you a message about your book listing.',
      createdAt: DateTime(2026, 9, 29, 14),
      isRead: true,
    ),
  ];

  void send(NotificationRequest request) {
    final notification = AppNotification(
      id: 'n-${DateTime.now().microsecondsSinceEpoch}',
      kind: request.kind,
      title: request.title,
      message: request.message,
      createdAt: DateTime.now(),
    );
    state = [notification, ...state];
  }

  void markRead(String id) {
    state = [
      for (final notification in state)
        notification.id == id
            ? notification.copyWith(isRead: true)
            : notification,
    ];
  }

  void markAllRead() {
    state = [
      for (final notification in state) notification.copyWith(isRead: true),
    ];
  }
}

final notificationCenterProvider =
    NotifierProvider<NotificationCenterNotifier, List<AppNotification>>(
      NotificationCenterNotifier.new,
    );

/// Public frontend-only notification entry point for other features.
void sendNotification(WidgetRef ref, NotificationRequest request) =>
    ref.read(notificationCenterProvider.notifier).send(request);

final unreadNotificationCountProvider = Provider<int>(
  (ref) => ref
      .watch(notificationCenterProvider)
      .where((notification) => !notification.isRead)
      .length,
);

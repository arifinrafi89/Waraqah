import '../../domain/entities/notification_kind.dart';
import '../models/app_notification_model.dart';

/// "me"'s notifications on a fresh start, a few hours or days before [now]:
/// the gift order on its way, the Atomic Habits Listing approved, a price
/// drop on Sapiens (all unread) and the Zero to One Sell Back paid (read).
List<AppNotificationModel> notificationSeed(DateTime now) => [
  AppNotificationModel(
    id: 'nt-seed-1',
    kind: NotificationKind.orderStatus,
    createdAt: now.subtract(const Duration(hours: 3)),
    params: const {'number': 'WQ-100215', 'status': 'shipped'},
    target: const NotificationTargetModel(
      kind: NotificationTargetKind.order,
      id: 'WQ-100215',
    ),
  ),
  AppNotificationModel(
    id: 'nt-seed-2',
    kind: NotificationKind.alertTriggered,
    createdAt: now.subtract(const Duration(hours: 9)),
    params: const {'title': 'Sapiens', 'reason': 'priceDrop'},
    target: const NotificationTargetModel(
      kind: NotificationTargetKind.book,
      id: 'bk-sapiens',
    ),
  ),
  AppNotificationModel(
    id: 'nt-seed-3',
    kind: NotificationKind.listingDecided,
    createdAt: now.subtract(const Duration(days: 2)),
    params: const {'title': 'Atomic Habits', 'decision': 'approve'},
    target: const NotificationTargetModel(
      kind: NotificationTargetKind.listing,
      id: 'p2p-7',
    ),
  ),
  AppNotificationModel(
    id: 'nt-seed-4',
    kind: NotificationKind.sellBackPaid,
    createdAt: now.subtract(const Duration(days: 13)),
    read: true,
    params: const {'title': 'Zero to One', 'amount': '180'},
    target: const NotificationTargetModel(
      kind: NotificationTargetKind.sellBack,
      id: 'SB-201',
    ),
  ),
];

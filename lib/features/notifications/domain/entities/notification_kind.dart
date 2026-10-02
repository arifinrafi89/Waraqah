import '../../../profile/domain/entities/profile_prefs.dart';

/// What happened to the Reader. The app builds each kind's text from ARB.
/// Offers and messages are never notifications: the inbox badge is theirs.
enum NotificationKind {
  orderStatus,
  returnDecided,
  listingDecided,
  moderationWarning,
  banned,
  saleSent,
  saleCompleted,
  saleSettled,
  sellBackPaid,
  sellBackReturned,
  alertTriggered,
  bookWanted,
}

extension NotificationKindX on NotificationKind {
  /// The settings switch that mutes this kind; `null` for moderation, which
  /// can't be muted.
  NotificationGroup? get group => switch (this) {
    NotificationKind.orderStatus ||
    NotificationKind.returnDecided => NotificationGroup.orders,
    NotificationKind.moderationWarning || NotificationKind.banned => null,
    NotificationKind.alertTriggered => NotificationGroup.alerts,
    _ => NotificationGroup.usedBooks,
  };
}

/// Where tapping a notification goes.
enum NotificationTargetKind { order, listing, myListings, sale, sellBack, book }

import '../../domain/entities/notification_kind.dart';
import 'notification_fake_store.dart';
import 'notification_sends.dart';

/// Waraqah-handled sales' and Sell Back's notifications, one call per
/// event.
extension NotificationSaleSends on NotificationFakeStore {
  void saleSent(String buyerId, String saleId, String title) => send(
    buyerId,
    NotificationKind.saleSent,
    params: {'title': title},
    target: notificationTo(NotificationTargetKind.sale, saleId),
  );

  void saleCompleted(String sellerId, String saleId, String title, int bdt) =>
      send(
        sellerId,
        NotificationKind.saleCompleted,
        params: {'title': title, 'amount': '$bdt'},
        target: notificationTo(NotificationTargetKind.sale, saleId),
      );

  /// A moderator settled a dispute: [refund] the buyer, or pay the seller.
  /// Both sides hear, each with their own amount.
  void saleSettled({
    required String buyerId,
    required String sellerId,
    required String saleId,
    required String title,
    required bool refund,
    required int amountBdt,
  }) {
    for (final (reader, role) in [(buyerId, 'buyer'), (sellerId, 'seller')]) {
      send(
        reader,
        NotificationKind.saleSettled,
        params: {
          'title': title,
          'outcome': refund ? 'refund' : 'paid',
          'role': role,
          'amount': '$amountBdt',
        },
        target: notificationTo(NotificationTargetKind.sale, saleId),
      );
    }
  }

  void sellBackPaid(String readerId, String id, String title, int bdt) => send(
    readerId,
    NotificationKind.sellBackPaid,
    params: {'title': title, 'amount': '$bdt'},
    target: notificationTo(NotificationTargetKind.sellBack, id),
  );

  void sellBackReturned(String readerId, String id, String title) => send(
    readerId,
    NotificationKind.sellBackReturned,
    params: {'title': title},
    target: notificationTo(NotificationTargetKind.sellBack, id),
  );
}

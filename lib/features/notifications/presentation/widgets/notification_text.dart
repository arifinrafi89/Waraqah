import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../../orders/presentation/widgets/order_labels.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/entities/notification_kind.dart';

/// A notification's title and line, built in the Reader's language from
/// its kind and params. The server never sends the words.
({String title, String body}) notificationText(
  AppL10n l10n,
  AppNotification n,
) {
  final p = n.params;
  final title = p['title'] ?? '';
  final amount = Bdt.format(int.tryParse(p['amount'] ?? '') ?? 0);
  return switch (n.kind) {
    NotificationKind.orderStatus => (
      title: l10n.notificationOrderStatus(
        p['number'] ?? '',
        l10n.orderStatus(
          OrderStatus.values.asNameMap()[p['status']] ?? OrderStatus.placed,
        ),
      ),
      body: l10n.notificationOrderStatusBody,
    ),
    NotificationKind.returnDecided =>
      p['approved'] == 'true'
          ? (
              title: l10n.notificationReturnApproved(p['number'] ?? ''),
              body: l10n.notificationReturnApprovedBody,
            )
          : (
              title: l10n.notificationReturnRejected(p['number'] ?? ''),
              body: l10n.notificationReturnRejectedBody,
            ),
    NotificationKind.listingDecided => switch (p['decision']) {
      'approved' => (
        title: l10n.notificationListingApproved(title),
        body: l10n.notificationListingApprovedBody,
      ),
      'changes' => (
        title: l10n.notificationListingChanges(title),
        body: p['reason'] ?? '',
      ),
      _ => (
        title: l10n.notificationListingRejected(title),
        body: p['reason'] ?? '',
      ),
    },
    NotificationKind.moderationWarning => (
      title: l10n.notificationWarning,
      body: l10n.notificationWarningBody(p['strikes'] ?? '1', p['max'] ?? '3'),
    ),
    NotificationKind.banned => (
      title: l10n.notificationBanned,
      body: l10n.notificationBannedBody,
    ),
    NotificationKind.saleSent => (
      title: l10n.notificationSaleSent(title),
      body: l10n.notificationSaleSentBody,
    ),
    NotificationKind.saleCompleted => (
      title: l10n.notificationSaleCompleted(title),
      body: l10n.notificationEarned(amount),
    ),
    NotificationKind.saleSettled =>
      p['outcome'] == 'refund'
          ? (
              title: l10n.notificationSaleRefunded(title),
              body: l10n.notificationInWallet(amount),
            )
          : (
              title: l10n.notificationSalePaid(title),
              body: l10n.notificationEarned(amount),
            ),
    NotificationKind.sellBackPaid => (
      title: l10n.notificationSellBackPaid(title),
      body: l10n.notificationInWallet(amount),
    ),
    NotificationKind.sellBackReturned => (
      title: l10n.notificationSellBackReturned(title),
      body: l10n.notificationSellBackReturnedBody,
    ),
    NotificationKind.alertTriggered =>
      p['reason'] == 'backInStock'
          ? (
              title: l10n.notificationBackInStock(title),
              body: l10n.notificationAlertBody,
            )
          : (
              title: l10n.notificationPriceDrop(title),
              body: l10n.notificationAlertBody,
            ),
    NotificationKind.bookWanted => (
      title: l10n.notificationBookWanted(title),
      body: l10n.notificationBookWantedBody,
    ),
  };
}

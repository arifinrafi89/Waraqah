import '../../../../l10n/app_localizations.dart';

/// A settled dispute, told to the buyer or the seller.
({String title, String body}) settledText(
  AppL10n l10n,
  Map<String, String> p,
  String title,
  String amount,
) {
  final buyer = p['role'] == 'buyer';
  return switch (p['outcome']) {
    'refund' when buyer => (
      title: l10n.notificationSaleRefunded(title),
      body: l10n.notificationInWallet(amount),
    ),
    'refund' => (
      title: l10n.notificationSaleSettled(title),
      body: l10n.notificationSaleRefundedSeller,
    ),
    _ when buyer => (
      title: l10n.notificationSaleSettled(title),
      body: l10n.notificationSalePaidBuyer,
    ),
    _ => (
      title: l10n.notificationSaleSettled(title),
      body: l10n.notificationEarned(amount),
    ),
  };
}

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/sell_back.dart';

extension SellBackLabels on AppL10n {
  /// "Pickup booked", "Being checked", "Paid ৳180" or "Sent back to you".
  String sellBackStatus(SellBack sellBack) => switch (sellBack.status) {
    SellBackStatus.scheduled => sellBackStatusScheduled,
    SellBackStatus.pickedUp => sellBackStatusPickedUp,
    SellBackStatus.paid => sellBackStatusPaid(
      Bdt.format(sellBack.paidBdt ?? sellBack.quoteBdt),
    ),
    SellBackStatus.returned => sellBackStatusReturned,
  };
}

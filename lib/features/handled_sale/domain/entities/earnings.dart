import 'package:freezed_annotation/freezed_annotation.dart';

part 'earnings.freezed.dart';

/// Money sent to the seller's bKash.
@freezed
abstract class Payout with _$Payout {
  const factory Payout({required int amountBdt, required DateTime at}) =
      _Payout;
}

/// A seller's money from Waraqah-handled sales.
@freezed
abstract class Earnings with _$Earnings {
  const factory Earnings({
    /// Waraqah holds it until buyers confirm.
    required int heldBdt,

    /// Released by buyers or moderators, all time.
    required int earnedBdt,
    required int paidOutBdt,

    /// Newest first.
    @Default(<Payout>[]) List<Payout> payouts,
  }) = _Earnings;
}

extension EarningsX on Earnings {
  /// Earned but not paid out yet.
  int get availableBdt => earnedBdt - paidOutBdt;
}

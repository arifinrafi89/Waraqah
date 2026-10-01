import 'dart:math';

/// How Waraqah points work, used the same way by the app and the server:
/// - earn 1 point for every ৳100 paid for books (delivery doesn't count)
/// - spend them at checkout, 1 point = ৳1 off, once you have [minToSpend]
/// - points can pay for at most [maxShare] of the books' price
abstract final class LoyaltyRules {
  static const int bdtPerPointEarned = 100;
  static const int minToSpend = 50;
  static const double maxShare = 0.2;

  /// Points earned for paying [booksBdt] for books.
  static int earnedFor(int booksBdt) => max(0, booksBdt) ~/ bdtPerPointEarned;

  /// The most points an order of [booksBdt] can use from [balance]; 0
  /// below [minToSpend].
  static int usable({required int balance, required int booksBdt}) {
    if (balance < minToSpend) return 0;
    return min(balance, (max(0, booksBdt) * maxShare).floor());
  }
}

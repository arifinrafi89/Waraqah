import '../../../p2p/domain/entities/p2p_listing.dart';

/// Sell Back prices, from the cheapest printed Edition's new price.
abstract final class SellBackRules {
  /// What Waraqah pays, as a share of new, by condition.
  static const Map<BookCondition, double> payShare = {
    BookCondition.likeNew: 0.35,
    BookCondition.veryGood: 0.30,
    BookCondition.good: 0.25,
    BookCondition.acceptable: 0.15,
  };

  /// What Waraqah resells it for as Certified Used.
  static const Map<BookCondition, double> resellShare = {
    BookCondition.likeNew: 0.65,
    BookCondition.veryGood: 0.55,
    BookCondition.good: 0.45,
    BookCondition.acceptable: 0.35,
  };

  /// Each flag (highlighting, notes, damage) takes this off what's paid.
  static const double perFlag = 0.05;
  static const int minQuoteBdt = 30;
  static const int minAddress = 5;

  /// The instant quote, rounded to ৳10, never under [minQuoteBdt].
  static int quote(int newPriceBdt, BookCondition condition, {int flags = 0}) {
    final share = (payShare[condition]! - flags * perFlag).clamp(0.05, 1.0);
    final price = _round(newPriceBdt * share);
    return price < minQuoteBdt ? minQuoteBdt : price;
  }

  /// The Certified Used price after grading.
  static int resellPrice(int newPriceBdt, BookCondition condition) =>
      _round(newPriceBdt * resellShare[condition]!);

  static int _round(double bdt) => (bdt / 10).round() * 10;
}

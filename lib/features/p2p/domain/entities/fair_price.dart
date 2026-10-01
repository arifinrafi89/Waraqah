import 'p2p_listing.dart';

/// How an asking price compares with the fair range.
enum PriceVerdict { low, fair, high, aboveNew }

/// What a used copy usually sells for, from the new price and the
/// condition: "Fair price: ৳250–৳320".
class FairPrice {
  const FairPrice(this.lowBdt, this.highBdt, this.newPriceBdt);

  /// Share of the new price, lowest and highest, by condition.
  static const Map<BookCondition, (double, double)> shares = {
    BookCondition.likeNew: (0.60, 0.75),
    BookCondition.veryGood: (0.50, 0.65),
    BookCondition.good: (0.40, 0.55),
    BookCondition.acceptable: (0.25, 0.40),
  };

  /// Each flag (highlighting, notes, damage) takes this much off.
  static const double perFlag = 0.05;

  final int lowBdt;
  final int highBdt;
  final int newPriceBdt;

  /// The range for a copy of a Book that costs [newPriceBdt] new, rounded
  /// to ৳10. `null` without a new price to compare with.
  static FairPrice? of({
    required int? newPriceBdt,
    required BookCondition condition,
    int flags = 0,
  }) {
    if (newPriceBdt == null || newPriceBdt <= 0) return null;
    final (low, high) = shares[condition]!;
    final off = flags * perFlag;
    int price(double share) =>
        ((newPriceBdt * (share - off).clamp(0.1, 1.0)) / 10).round() * 10;
    return FairPrice(price(low), price(high), newPriceBdt);
  }

  PriceVerdict verdict(int askingBdt) {
    if (askingBdt >= newPriceBdt) return PriceVerdict.aboveNew;
    if (askingBdt > highBdt) return PriceVerdict.high;
    if (askingBdt < lowBdt) return PriceVerdict.low;
    return PriceVerdict.fair;
  }
}

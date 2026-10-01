import '../../../p2p/domain/entities/fair_price.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../sell_back/domain/entities/sell_back_rules.dart';

/// The two ways to sell a book the reader just finished, for a copy read
/// once (Like New): what readers pay for one, and Waraqah's Sell Back.
class FinishedItOffers {
  const FinishedItOffers(this.readers, this.sellBackBdt);

  /// The fair range on the used marketplace.
  final FairPrice readers;

  /// What Waraqah pays straight away.
  final int sellBackBdt;

  /// What a copy that costs [newPriceBdt] new is worth. `null` without a
  /// new price.
  static FinishedItOffers? of(int? newPriceBdt) {
    final fair = FairPrice.of(
      newPriceBdt: newPriceBdt,
      condition: BookCondition.likeNew,
    );
    if (fair == null) return null;
    return FinishedItOffers(
      fair,
      SellBackRules.quote(newPriceBdt!, BookCondition.likeNew),
    );
  }
}

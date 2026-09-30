import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers.freezed.dart';

/// One book in an offer, at the Edition the offer is for.
@freezed
abstract class OfferItem with _$OfferItem {
  const factory OfferItem({
    required String bookId,
    required String editionId,
    required String title,

    /// The Edition's usual price.
    required int regularPriceBdt,

    /// The flash-sale price; the same as regular outside a flash sale.
    required int priceBdt,
    @Default(0) int coverSeed,
  }) = _OfferItem;
}

/// A few Editions at a lower price until [endsAt].
@freezed
abstract class FlashSale with _$FlashSale {
  const factory FlashSale({
    required String title,
    required DateTime endsAt,
    required List<OfferItem> items,
  }) = _FlashSale;
}

/// Several books bought together for one price.
@freezed
abstract class Bundle with _$Bundle {
  const factory Bundle({
    required String id,
    required String title,
    required List<OfferItem> items,
    required int priceBdt,
  }) = _Bundle;
}

/// A book that isn't out yet but can be ordered now.
@freezed
abstract class Preorder with _$Preorder {
  const factory Preorder({
    required OfferItem item,
    required DateTime releaseDate,
  }) = _Preorder;
}

/// Everything on offer right now.
@freezed
abstract class Offers with _$Offers {
  const factory Offers({
    FlashSale? flashSale,
    @Default(<Bundle>[]) List<Bundle> bundles,
    @Default(<Preorder>[]) List<Preorder> preorders,
  }) = _Offers;
}

extension BundleX on Bundle {
  int get regularPriceBdt =>
      items.fold(0, (sum, item) => sum + item.regularPriceBdt);

  int get savingsBdt => regularPriceBdt - priceBdt;
}

extension OffersX on Offers {
  /// The flash-sale item for [editionId], if it's in the sale.
  OfferItem? flashItem(String editionId) =>
      flashSale?.items.where((item) => item.editionId == editionId).firstOrNull;

  List<Bundle> bundlesWith(String bookId) => [
    for (final bundle in bundles)
      if (bundle.items.any((item) => item.bookId == bookId)) bundle,
  ];

  Preorder? preorder(String editionId) =>
      preorders.where((p) => p.item.editionId == editionId).firstOrNull;
}

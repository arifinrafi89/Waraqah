import 'package:freezed_annotation/freezed_annotation.dart';

part 'deals.freezed.dart';

/// One book in an offer, at the Edition the offer is for.
@freezed
abstract class DealItem with _$DealItem {
  const factory DealItem({
    required String bookId,
    required String editionId,
    required String title,

    /// The Edition's usual price.
    required int regularPriceBdt,

    /// The flash-sale price; the same as regular outside a flash sale.
    required int priceBdt,
    @Default(0) int coverSeed,
  }) = _DealItem;
}

/// A few Editions at a lower price until [endsAt].
@freezed
abstract class FlashSale with _$FlashSale {
  const factory FlashSale({
    required String title,
    required DateTime endsAt,
    required List<DealItem> items,
  }) = _FlashSale;
}

/// Several books bought together for one price.
@freezed
abstract class Bundle with _$Bundle {
  const factory Bundle({
    required String id,
    required String title,
    required List<DealItem> items,
    required int priceBdt,
  }) = _Bundle;
}

/// A book that isn't out yet but can be ordered now.
@freezed
abstract class Preorder with _$Preorder {
  const factory Preorder({
    required DealItem item,
    required DateTime releaseDate,
  }) = _Preorder;
}

/// Everything on offer right now.
@freezed
abstract class Deals with _$Deals {
  const factory Deals({
    FlashSale? flashSale,
    @Default(<Bundle>[]) List<Bundle> bundles,
    @Default(<Preorder>[]) List<Preorder> preorders,
  }) = _Deals;
}

extension BundleX on Bundle {
  int get regularPriceBdt =>
      items.fold(0, (sum, item) => sum + item.regularPriceBdt);

  int get savingsBdt => regularPriceBdt - priceBdt;
}

extension DealsX on Deals {
  /// The flash-sale item for [editionId], if it's in the sale.
  DealItem? flashItem(String editionId) =>
      flashSale?.items.where((item) => item.editionId == editionId).firstOrNull;

  List<Bundle> bundlesWith(String bookId) => [
    for (final bundle in bundles)
      if (bundle.items.any((item) => item.bookId == bookId)) bundle,
  ];

  Preorder? preorder(String editionId) =>
      preorders.where((p) => p.item.editionId == editionId).firstOrNull;
}

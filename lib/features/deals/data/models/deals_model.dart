import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/deals.dart';

part 'deals_model.freezed.dart';
part 'deals_model.g.dart';

@freezed
abstract class DealItemModel with _$DealItemModel {
  const factory DealItemModel({
    required String bookId,
    required String editionId,
    required String title,
    required int regularPriceBdt,
    required int priceBdt,
    @Default(0) int coverSeed,
  }) = _DealItemModel;

  factory DealItemModel.fromJson(Map<String, dynamic> json) =>
      _$DealItemModelFromJson(json);
}

@freezed
abstract class FlashSaleModel with _$FlashSaleModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory FlashSaleModel({
    required String title,
    required DateTime endsAt,
    required List<DealItemModel> items,
  }) = _FlashSaleModel;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) =>
      _$FlashSaleModelFromJson(json);
}

@freezed
abstract class BundleModel with _$BundleModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BundleModel({
    required String id,
    required String title,
    required List<DealItemModel> items,
    required int priceBdt,
  }) = _BundleModel;

  factory BundleModel.fromJson(Map<String, dynamic> json) =>
      _$BundleModelFromJson(json);
}

@freezed
abstract class PreorderModel with _$PreorderModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PreorderModel({
    required DealItemModel item,
    required DateTime releaseDate,
  }) = _PreorderModel;

  factory PreorderModel.fromJson(Map<String, dynamic> json) =>
      _$PreorderModelFromJson(json);
}

@freezed
abstract class DealsModel with _$DealsModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory DealsModel({
    FlashSaleModel? flashSale,
    @Default(<BundleModel>[]) List<BundleModel> bundles,
    @Default(<PreorderModel>[]) List<PreorderModel> preorders,
  }) = _DealsModel;

  factory DealsModel.fromJson(Map<String, dynamic> json) =>
      _$DealsModelFromJson(json);
}

extension DealsModelX on DealsModel {
  Deals toEntity() => Deals(
    flashSale: flashSale == null
        ? null
        : FlashSale(
            title: flashSale!.title,
            endsAt: flashSale!.endsAt,
            items: [for (final i in flashSale!.items) i.toEntity()],
          ),
    bundles: [
      for (final b in bundles)
        Bundle(
          id: b.id,
          title: b.title,
          items: [for (final i in b.items) i.toEntity()],
          priceBdt: b.priceBdt,
        ),
    ],
    preorders: [
      for (final p in preorders)
        Preorder(item: p.item.toEntity(), releaseDate: p.releaseDate),
    ],
  );
}

extension DealItemModelX on DealItemModel {
  DealItem toEntity() => DealItem(
    bookId: bookId,
    editionId: editionId,
    title: title,
    regularPriceBdt: regularPriceBdt,
    priceBdt: priceBdt,
    coverSeed: coverSeed,
  );
}

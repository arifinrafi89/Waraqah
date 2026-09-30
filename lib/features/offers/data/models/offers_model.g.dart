// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferItemModel _$OfferItemModelFromJson(Map<String, dynamic> json) =>
    _OfferItemModel(
      bookId: json['bookId'] as String,
      editionId: json['editionId'] as String,
      title: json['title'] as String,
      regularPriceBdt: (json['regularPriceBdt'] as num).toInt(),
      priceBdt: (json['priceBdt'] as num).toInt(),
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OfferItemModelToJson(_OfferItemModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'editionId': instance.editionId,
      'title': instance.title,
      'regularPriceBdt': instance.regularPriceBdt,
      'priceBdt': instance.priceBdt,
      'coverSeed': instance.coverSeed,
    };

_FlashSaleModel _$FlashSaleModelFromJson(Map<String, dynamic> json) =>
    _FlashSaleModel(
      title: json['title'] as String,
      endsAt: DateTime.parse(json['endsAt'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => OfferItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlashSaleModelToJson(_FlashSaleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'endsAt': instance.endsAt.toIso8601String(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_BundleModel _$BundleModelFromJson(Map<String, dynamic> json) => _BundleModel(
  id: json['id'] as String,
  title: json['title'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OfferItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  priceBdt: (json['priceBdt'] as num).toInt(),
);

Map<String, dynamic> _$BundleModelToJson(_BundleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'priceBdt': instance.priceBdt,
    };

_PreorderModel _$PreorderModelFromJson(Map<String, dynamic> json) =>
    _PreorderModel(
      item: OfferItemModel.fromJson(json['item'] as Map<String, dynamic>),
      releaseDate: DateTime.parse(json['releaseDate'] as String),
    );

Map<String, dynamic> _$PreorderModelToJson(_PreorderModel instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'releaseDate': instance.releaseDate.toIso8601String(),
    };

_OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => _OffersModel(
  flashSale: json['flashSale'] == null
      ? null
      : FlashSaleModel.fromJson(json['flashSale'] as Map<String, dynamic>),
  bundles:
      (json['bundles'] as List<dynamic>?)
          ?.map((e) => BundleModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BundleModel>[],
  preorders:
      (json['preorders'] as List<dynamic>?)
          ?.map((e) => PreorderModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PreorderModel>[],
);

Map<String, dynamic> _$OffersModelToJson(_OffersModel instance) =>
    <String, dynamic>{
      'flashSale': instance.flashSale?.toJson(),
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
      'preorders': instance.preorders.map((e) => e.toJson()).toList(),
    };

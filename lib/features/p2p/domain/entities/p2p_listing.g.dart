// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_P2pListing _$P2pListingFromJson(Map<String, dynamic> json) => _P2pListing(
  id: json['id'] as String,
  title: json['title'] as String,
  sellerName: json['sellerName'] as String,
  sellerBatch: json['sellerBatch'] as String,
  priceBdt: (json['priceBdt'] as num).toInt(),
  condition:
      $enumDecodeNullable(_$BookConditionEnumMap, json['condition']) ??
      BookCondition.good,
  isAvailable: json['isAvailable'] as bool? ?? true,
  coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$P2pListingToJson(_P2pListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sellerName': instance.sellerName,
      'sellerBatch': instance.sellerBatch,
      'priceBdt': instance.priceBdt,
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'isAvailable': instance.isAvailable,
      'coverSeed': instance.coverSeed,
    };

const _$BookConditionEnumMap = {
  BookCondition.likeNew: 'likeNew',
  BookCondition.good: 'good',
  BookCondition.fair: 'fair',
};

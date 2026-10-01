// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueuedListingModel _$QueuedListingModelFromJson(Map<String, dynamic> json) =>
    _QueuedListingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      priceBdt: (json['priceBdt'] as num).toInt(),
      condition: $enumDecode(_$BookConditionEnumMap, json['condition']),
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
      sellerStrikes: (json['sellerStrikes'] as num?)?.toInt() ?? 0,
      newPriceBdt: (json['newPriceBdt'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$QueuedListingModelToJson(_QueuedListingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'priceBdt': instance.priceBdt,
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'flags': instance.flags,
      'photos': instance.photos,
      'coverSeed': instance.coverSeed,
      'sellerStrikes': instance.sellerStrikes,
      'newPriceBdt': instance.newPriceBdt,
      'note': instance.note,
    };

const _$BookConditionEnumMap = {
  BookCondition.likeNew: 'likeNew',
  BookCondition.veryGood: 'veryGood',
  BookCondition.good: 'good',
  BookCondition.acceptable: 'acceptable',
};

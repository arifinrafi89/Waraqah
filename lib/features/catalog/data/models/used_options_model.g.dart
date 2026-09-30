// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'used_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsedCopyModel _$UsedCopyModelFromJson(Map<String, dynamic> json) =>
    _UsedCopyModel(
      id: json['id'] as String,
      priceBdt: (json['priceBdt'] as num).toInt(),
      condition: $enumDecode(_$BookConditionEnumMap, json['condition']),
      sellerName: json['sellerName'] as String?,
      area: json['area'] as String?,
    );

Map<String, dynamic> _$UsedCopyModelToJson(_UsedCopyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priceBdt': instance.priceBdt,
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'sellerName': instance.sellerName,
      'area': instance.area,
    };

const _$BookConditionEnumMap = {
  BookCondition.likeNew: 'likeNew',
  BookCondition.veryGood: 'veryGood',
  BookCondition.good: 'good',
  BookCondition.acceptable: 'acceptable',
};

_UsedOptionsModel _$UsedOptionsModelFromJson(Map<String, dynamic> json) =>
    _UsedOptionsModel(
      certifiedUsed: json['certifiedUsed'] == null
          ? null
          : UsedCopyModel.fromJson(
              json['certifiedUsed'] as Map<String, dynamic>,
            ),
      listings:
          (json['listings'] as List<dynamic>?)
              ?.map((e) => UsedCopyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UsedCopyModel>[],
      resaleValueBdt: (json['resaleValueBdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsedOptionsModelToJson(_UsedOptionsModel instance) =>
    <String, dynamic>{
      'certifiedUsed': instance.certifiedUsed?.toJson(),
      'listings': instance.listings.map((e) => e.toJson()).toList(),
      'resaleValueBdt': instance.resaleValueBdt,
    };

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
    );

Map<String, dynamic> _$UsedCopyModelToJson(_UsedCopyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priceBdt': instance.priceBdt,
      'condition': _$BookConditionEnumMap[instance.condition]!,
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
      resaleValueBdt: (json['resaleValueBdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsedOptionsModelToJson(_UsedOptionsModel instance) =>
    <String, dynamic>{
      'certifiedUsed': instance.certifiedUsed?.toJson(),
      'resaleValueBdt': instance.resaleValueBdt,
    };

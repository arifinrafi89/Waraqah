// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: json['id'] as String,
  titleEn: json['titleEn'] as String,
  titleBn: json['titleBn'] as String,
  subtitleEn: json['subtitleEn'] as String,
  subtitleBn: json['subtitleBn'] as String,
  seed: (json['seed'] as num).toInt(),
  target: BannerTargetModel.fromJson(json['target'] as Map<String, dynamic>),
  season: $enumDecodeNullable(_$SeasonEnumMap, json['season']),
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleEn': instance.titleEn,
      'titleBn': instance.titleBn,
      'subtitleEn': instance.subtitleEn,
      'subtitleBn': instance.subtitleBn,
      'seed': instance.seed,
      'target': instance.target.toJson(),
      'season': _$SeasonEnumMap[instance.season],
    };

const _$SeasonEnumMap = {
  Season.ramadan: 'ramadan',
  Season.boiMela: 'boiMela',
  Season.admission: 'admission',
  Season.backToSchool: 'backToSchool',
};

_BannerTargetModel _$BannerTargetModelFromJson(Map<String, dynamic> json) =>
    _BannerTargetModel(
      kind: $enumDecode(_$BannerTargetKindEnumMap, json['kind']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$BannerTargetModelToJson(_BannerTargetModel instance) =>
    <String, dynamic>{
      'kind': _$BannerTargetKindEnumMap[instance.kind]!,
      'value': instance.value,
    };

const _$BannerTargetKindEnumMap = {
  BannerTargetKind.collection: 'collection',
  BannerTargetKind.section: 'section',
  BannerTargetKind.book: 'book',
  BannerTargetKind.search: 'search',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => _SeasonModel(
  season: $enumDecode(_$SeasonEnumMap, json['season']),
  titleEn: json['titleEn'] as String,
  titleBn: json['titleBn'] as String,
  subtitleEn: json['subtitleEn'] as String,
  subtitleBn: json['subtitleBn'] as String,
  seed: (json['seed'] as num).toInt(),
  collectionId: json['collectionId'] as String,
);

Map<String, dynamic> _$SeasonModelToJson(_SeasonModel instance) =>
    <String, dynamic>{
      'season': _$SeasonEnumMap[instance.season]!,
      'titleEn': instance.titleEn,
      'titleBn': instance.titleBn,
      'subtitleEn': instance.subtitleEn,
      'subtitleBn': instance.subtitleBn,
      'seed': instance.seed,
      'collectionId': instance.collectionId,
    };

const _$SeasonEnumMap = {
  Season.ramadan: 'ramadan',
  Season.boiMela: 'boiMela',
  Season.admission: 'admission',
  Season.backToSchool: 'backToSchool',
};

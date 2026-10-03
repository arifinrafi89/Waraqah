// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadingStatsModel _$ReadingStatsModelFromJson(Map<String, dynamic> json) =>
    _ReadingStatsModel(
      year: (json['year'] as num).toInt(),
      goal: (json['goal'] as num?)?.toInt(),
      finishedThisYear: (json['finishedThisYear'] as num).toInt(),
      streakDays: (json['streakDays'] as num).toInt(),
      readToday: json['readToday'] as bool,
      perMonth: (json['perMonth'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      topCategories: (json['topCategories'] as List<dynamic>)
          .map((e) => CategoryCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReadingStatsModelToJson(_ReadingStatsModel instance) =>
    <String, dynamic>{
      'year': instance.year,
      'goal': instance.goal,
      'finishedThisYear': instance.finishedThisYear,
      'streakDays': instance.streakDays,
      'readToday': instance.readToday,
      'perMonth': instance.perMonth,
      'topCategories': instance.topCategories.map((e) => e.toJson()).toList(),
    };

_CategoryCountModel _$CategoryCountModelFromJson(Map<String, dynamic> json) =>
    _CategoryCountModel(
      nameEn: json['nameEn'] as String,
      nameBn: json['nameBn'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryCountModelToJson(_CategoryCountModel instance) =>
    <String, dynamic>{
      'nameEn': instance.nameEn,
      'nameBn': instance.nameBn,
      'count': instance.count,
    };

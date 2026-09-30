// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AyahModel _$AyahModelFromJson(Map<String, dynamic> json) => _AyahModel(
  arabic: json['arabic'] as String,
  translation: json['translation'] as String,
  surahEn: json['surahEn'] as String,
  surahBn: json['surahBn'] as String,
  surahNumber: (json['surahNumber'] as num).toInt(),
  verseNumber: (json['verseNumber'] as num).toInt(),
);

Map<String, dynamic> _$AyahModelToJson(_AyahModel instance) =>
    <String, dynamic>{
      'arabic': instance.arabic,
      'translation': instance.translation,
      'surahEn': instance.surahEn,
      'surahBn': instance.surahBn,
      'surahNumber': instance.surahNumber,
      'verseNumber': instance.verseNumber,
    };

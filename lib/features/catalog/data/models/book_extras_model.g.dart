// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_extras_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentsEntryModel _$ContentsEntryModelFromJson(Map<String, dynamic> json) =>
    _ContentsEntryModel(
      title: json['title'] as String,
      isPart: json['isPart'] as bool? ?? false,
    );

Map<String, dynamic> _$ContentsEntryModelToJson(_ContentsEntryModel instance) =>
    <String, dynamic>{'title': instance.title, 'isPart': instance.isPart};

_LookInsideModel _$LookInsideModelFromJson(Map<String, dynamic> json) =>
    _LookInsideModel(
      contents:
          (json['contents'] as List<dynamic>?)
              ?.map(
                (e) => ContentsEntryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ContentsEntryModel>[],
      samplePages:
          (json['samplePages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$LookInsideModelToJson(_LookInsideModel instance) =>
    <String, dynamic>{
      'contents': instance.contents.map((e) => e.toJson()).toList(),
      'samplePages': instance.samplePages,
    };

_SeriesEntryModel _$SeriesEntryModelFromJson(Map<String, dynamic> json) =>
    _SeriesEntryModel(
      position: (json['position'] as num).toInt(),
      title: json['title'] as String,
      bookId: json['bookId'] as String?,
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SeriesEntryModelToJson(_SeriesEntryModel instance) =>
    <String, dynamic>{
      'position': instance.position,
      'title': instance.title,
      'bookId': instance.bookId,
      'coverSeed': instance.coverSeed,
    };

_BookSeriesModel _$BookSeriesModelFromJson(Map<String, dynamic> json) =>
    _BookSeriesModel(
      id: json['id'] as String,
      name: json['name'] as String,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => SeriesEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookSeriesModelToJson(_BookSeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };

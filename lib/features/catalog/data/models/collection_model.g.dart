// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    _CollectionModel(
      id: json['id'] as String,
      titleEn: json['titleEn'] as String,
      titleBn: json['titleBn'] as String,
      noteEn: json['noteEn'] as String,
      noteBn: json['noteBn'] as String,
      bookIds: (json['bookIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      section: $enumDecodeNullable(_$SectionEnumMap, json['section']),
      expertId: json['expertId'] as String?,
    );

Map<String, dynamic> _$CollectionModelToJson(_CollectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleEn': instance.titleEn,
      'titleBn': instance.titleBn,
      'noteEn': instance.noteEn,
      'noteBn': instance.noteBn,
      'bookIds': instance.bookIds,
      'section': _$SectionEnumMap[instance.section],
      'expertId': instance.expertId,
    };

const _$SectionEnumMap = {
  Section.academic: 'academic',
  Section.religious: 'religious',
  Section.literature: 'literature',
  Section.admissionJobPrep: 'admissionJobPrep',
  Section.schoolCollege: 'schoolCollege',
  Section.nonFiction: 'nonFiction',
  Section.skillsTech: 'skillsTech',
  Section.children: 'children',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogRecordModel _$CatalogRecordModelFromJson(Map<String, dynamic> json) =>
    _CatalogRecordModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nameBn: json['nameBn'] as String?,
      section: $enumDecodeNullable(_$SectionEnumMap, json['section']),
      bookCount: (json['bookCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CatalogRecordModelToJson(_CatalogRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameBn': instance.nameBn,
      'section': _$SectionEnumMap[instance.section],
      'bookCount': instance.bookCount,
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

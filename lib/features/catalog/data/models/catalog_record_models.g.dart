// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_record_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['id'] as String,
      section: $enumDecode(_$SectionEnumMap, json['section']),
      nameEn: json['nameEn'] as String,
      nameBn: json['nameBn'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section': _$SectionEnumMap[instance.section]!,
      'nameEn': instance.nameEn,
      'nameBn': instance.nameBn,
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

_AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => _AuthorModel(
  id: json['id'] as String,
  name: json['name'] as String,
  nameBn: json['nameBn'] as String?,
  bio: json['bio'] as String?,
);

Map<String, dynamic> _$AuthorModelToJson(_AuthorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameBn': instance.nameBn,
      'bio': instance.bio,
    };

_PublisherModel _$PublisherModelFromJson(Map<String, dynamic> json) =>
    _PublisherModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nameBn: json['nameBn'] as String?,
    );

Map<String, dynamic> _$PublisherModelToJson(_PublisherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameBn': instance.nameBn,
    };

_SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) =>
    _SubjectModel(
      id: json['id'] as String,
      nameEn: json['nameEn'] as String,
      nameBn: json['nameBn'] as String,
    );

Map<String, dynamic> _$SubjectModelToJson(_SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameBn': instance.nameBn,
    };

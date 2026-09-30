// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: json['id'] as String,
  title: json['title'] as String,
  author: json['author'] as String,
  categoryId: json['categoryId'] as String,
  authorId: json['authorId'] as String,
  publisherId: json['publisherId'] as String,
  section: $enumDecode(_$SectionEnumMap, json['section']),
  originalLanguage: $enumDecode(
    _$BookLanguageEnumMap,
    json['originalLanguage'],
  ),
  editions: (json['editions'] as List<dynamic>)
      .map((e) => Edition.fromJson(e as Map<String, dynamic>))
      .toList(),
  addedAt: DateTime.parse(json['addedAt'] as String),
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  isBeneficial: json['isBeneficial'] as bool? ?? false,
  coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
  shortTitle: json['shortTitle'] as String?,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'categoryId': instance.categoryId,
  'authorId': instance.authorId,
  'publisherId': instance.publisherId,
  'section': _$SectionEnumMap[instance.section]!,
  'originalLanguage': _$BookLanguageEnumMap[instance.originalLanguage]!,
  'editions': instance.editions.map((e) => e.toJson()).toList(),
  'addedAt': instance.addedAt.toIso8601String(),
  'rating': instance.rating,
  'tags': instance.tags,
  'isBeneficial': instance.isBeneficial,
  'coverSeed': instance.coverSeed,
  'shortTitle': instance.shortTitle,
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

const _$BookLanguageEnumMap = {
  BookLanguage.bangla: 'bangla',
  BookLanguage.english: 'english',
  BookLanguage.arabic: 'arabic',
};

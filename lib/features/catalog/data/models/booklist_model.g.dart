// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BooklistModel _$BooklistModelFromJson(Map<String, dynamic> json) =>
    _BooklistModel(
      id: json['id'] as String,
      titleEn: json['titleEn'] as String,
      titleBn: json['titleBn'] as String,
      kind: $enumDecode(_$BooklistKindEnumMap, json['kind']),
      bookIds: (json['bookIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      noteEn: json['noteEn'] as String?,
      noteBn: json['noteBn'] as String?,
      isMine: json['isMine'] as bool? ?? false,
    );

Map<String, dynamic> _$BooklistModelToJson(_BooklistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleEn': instance.titleEn,
      'titleBn': instance.titleBn,
      'kind': _$BooklistKindEnumMap[instance.kind]!,
      'bookIds': instance.bookIds,
      'noteEn': instance.noteEn,
      'noteBn': instance.noteBn,
      'isMine': instance.isMine,
    };

const _$BooklistKindEnumMap = {
  BooklistKind.classList: 'classList',
  BooklistKind.examPrep: 'examPrep',
  BooklistKind.bookClub: 'bookClub',
  BooklistKind.personal: 'personal',
};

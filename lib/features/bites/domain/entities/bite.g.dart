// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bite _$BiteFromJson(Map<String, dynamic> json) => _Bite(
  id: json['id'] as String,
  authorName: json['authorName'] as String,
  authorHandle: json['authorHandle'] as String,
  text: json['text'] as String,
  taggedBookTitle: json['taggedBookTitle'] as String?,
  taggedBookId: json['taggedBookId'] as String?,
  avatarSeed: (json['avatarSeed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BiteToJson(_Bite instance) => <String, dynamic>{
  'id': instance.id,
  'authorName': instance.authorName,
  'authorHandle': instance.authorHandle,
  'text': instance.text,
  'taggedBookTitle': instance.taggedBookTitle,
  'taggedBookId': instance.taggedBookId,
  'avatarSeed': instance.avatarSeed,
};

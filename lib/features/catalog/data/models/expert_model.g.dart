// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpertModel _$ExpertModelFromJson(Map<String, dynamic> json) => _ExpertModel(
  id: json['id'] as String,
  name: json['name'] as String,
  nameBn: json['nameBn'] as String,
  credentialEn: json['credentialEn'] as String,
  credentialBn: json['credentialBn'] as String,
  kind: $enumDecode(_$ExpertKindEnumMap, json['kind']),
  verified: json['verified'] as bool? ?? false,
);

Map<String, dynamic> _$ExpertModelToJson(_ExpertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameBn': instance.nameBn,
      'credentialEn': instance.credentialEn,
      'credentialBn': instance.credentialBn,
      'kind': _$ExpertKindEnumMap[instance.kind]!,
      'verified': instance.verified,
    };

const _$ExpertKindEnumMap = {
  ExpertKind.teacher: 'teacher',
  ExpertKind.scholar: 'scholar',
  ExpertKind.writer: 'writer',
};

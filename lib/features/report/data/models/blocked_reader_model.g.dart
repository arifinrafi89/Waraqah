// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_reader_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockedReaderModel _$BlockedReaderModelFromJson(Map<String, dynamic> json) =>
    _BlockedReaderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      blockedAt: DateTime.parse(json['blockedAt'] as String),
    );

Map<String, dynamic> _$BlockedReaderModelToJson(_BlockedReaderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'blockedAt': instance.blockedAt.toIso8601String(),
    };

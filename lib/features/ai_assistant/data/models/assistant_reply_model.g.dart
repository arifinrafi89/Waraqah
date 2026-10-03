// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistant_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssistantReplyModel _$AssistantReplyModelFromJson(Map<String, dynamic> json) =>
    _AssistantReplyModel(
      id: json['id'] as String,
      text: json['text'] as String,
      bookIds:
          (json['bookIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$AssistantReplyModelToJson(
  _AssistantReplyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'bookIds': instance.bookIds,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistant_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssistantReplyModel _$AssistantReplyModelFromJson(
  Map<String, dynamic> json,
) => _AssistantReplyModel(
  id: json['id'] as String,
  text: json['text'] as String,
  bookIds:
      (json['bookIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  basket: json['basket'] == null
      ? null
      : AssistantBasketModel.fromJson(json['basket'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AssistantReplyModelToJson(
  _AssistantReplyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'bookIds': instance.bookIds,
  'basket': instance.basket?.toJson(),
};

_AssistantBasketModel _$AssistantBasketModelFromJson(
  Map<String, dynamic> json,
) => _AssistantBasketModel(
  editionIds: (json['editionIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  totalBdt: (json['totalBdt'] as num).toInt(),
);

Map<String, dynamic> _$AssistantBasketModelToJson(
  _AssistantBasketModel instance,
) => <String, dynamic>{
  'editionIds': instance.editionIds,
  'totalBdt': instance.totalBdt,
};

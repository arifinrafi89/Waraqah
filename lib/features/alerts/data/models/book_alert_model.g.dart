// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookAlertModel _$BookAlertModelFromJson(Map<String, dynamic> json) =>
    _BookAlertModel(
      id: json['id'] as String,
      kind: $enumDecode(_$AlertKindEnumMap, json['kind']),
      bookId: json['bookId'] as String,
      editionId: json['editionId'] as String,
      bookTitle: json['bookTitle'] as String,
      currentPriceBdt: (json['currentPriceBdt'] as num).toInt(),
      isTriggered: json['isTriggered'] as bool,
      targetPriceBdt: (json['targetPriceBdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookAlertModelToJson(_BookAlertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$AlertKindEnumMap[instance.kind]!,
      'bookId': instance.bookId,
      'editionId': instance.editionId,
      'bookTitle': instance.bookTitle,
      'currentPriceBdt': instance.currentPriceBdt,
      'isTriggered': instance.isTriggered,
      'targetPriceBdt': instance.targetPriceBdt,
    };

const _$AlertKindEnumMap = {
  AlertKind.backInStock: 'backInStock',
  AlertKind.priceDrop: 'priceDrop',
};

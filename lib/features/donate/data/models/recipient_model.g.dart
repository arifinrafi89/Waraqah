// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipientModel _$RecipientModelFromJson(Map<String, dynamic> json) =>
    _RecipientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      kind: $enumDecode(_$RecipientKindEnumMap, json['kind']),
      district: json['district'] as String,
      area: json['area'] as String,
      story: json['story'] as String,
      needs: (json['needs'] as List<dynamic>)
          .map((e) => RecipientNeedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipientModelToJson(_RecipientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': _$RecipientKindEnumMap[instance.kind]!,
      'district': instance.district,
      'area': instance.area,
      'story': instance.story,
      'needs': instance.needs.map((e) => e.toJson()).toList(),
    };

const _$RecipientKindEnumMap = {
  RecipientKind.library: 'library',
  RecipientKind.school: 'school',
  RecipientKind.madrasa: 'madrasa',
  RecipientKind.orphanage: 'orphanage',
};

_RecipientNeedModel _$RecipientNeedModelFromJson(Map<String, dynamic> json) =>
    _RecipientNeedModel(
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      editionId: json['editionId'] as String,
      priceBdt: (json['priceBdt'] as num).toInt(),
      wanted: (json['wanted'] as num).toInt(),
      received: (json['received'] as num).toInt(),
    );

Map<String, dynamic> _$RecipientNeedModelToJson(_RecipientNeedModel instance) =>
    <String, dynamic>{
      'book': instance.book.toJson(),
      'editionId': instance.editionId,
      'priceBdt': instance.priceBdt,
      'wanted': instance.wanted,
      'received': instance.received,
    };

_DonationModel _$DonationModelFromJson(Map<String, dynamic> json) =>
    _DonationModel(
      orderNumber: json['orderNumber'] as String,
      totalBdt: (json['totalBdt'] as num).toInt(),
    );

Map<String, dynamic> _$DonationModelToJson(_DonationModel instance) =>
    <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'totalBdt': instance.totalBdt,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wanted_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WantedBookModel _$WantedBookModelFromJson(Map<String, dynamic> json) =>
    _WantedBookModel(
      requestId: json['requestId'] as String,
      readerName: json['readerName'] as String,
      title: json['title'] as String,
      listingId: json['listingId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      maxPriceBdt: (json['maxPriceBdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WantedBookModelToJson(_WantedBookModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'readerName': instance.readerName,
      'title': instance.title,
      'listingId': instance.listingId,
      'createdAt': instance.createdAt.toIso8601String(),
      'maxPriceBdt': instance.maxPriceBdt,
    };

_BookDemandModel _$BookDemandModelFromJson(Map<String, dynamic> json) =>
    _BookDemandModel(
      title: json['title'] as String,
      requests: (json['requests'] as num).toInt(),
    );

Map<String, dynamic> _$BookDemandModelToJson(_BookDemandModel instance) =>
    <String, dynamic>{'title': instance.title, 'requests': instance.requests};

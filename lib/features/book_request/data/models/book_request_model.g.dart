// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookRequestModel _$BookRequestModelFromJson(Map<String, dynamic> json) =>
    _BookRequestModel(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      author: json['author'] as String?,
      bookId: json['bookId'] as String?,
      maxPriceBdt: (json['maxPriceBdt'] as num?)?.toInt(),
      note: json['note'] as String?,
      isOpen: json['isOpen'] as bool? ?? true,
      matchCount: (json['matchCount'] as num?)?.toInt() ?? 0,
      notifiedSellers: (json['notifiedSellers'] as num?)?.toInt() ?? 0,
      requesterId: json['requesterId'] as String? ?? 'me',
    );

Map<String, dynamic> _$BookRequestModelToJson(_BookRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'author': instance.author,
      'bookId': instance.bookId,
      'maxPriceBdt': instance.maxPriceBdt,
      'note': instance.note,
      'isOpen': instance.isOpen,
      'matchCount': instance.matchCount,
      'notifiedSellers': instance.notifiedSellers,
    };

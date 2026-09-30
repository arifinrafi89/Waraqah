// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_parts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLineModel _$OrderLineModelFromJson(Map<String, dynamic> json) =>
    _OrderLineModel(
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPriceBdt: (json['unitPriceBdt'] as num).toInt(),
      format: $enumDecodeNullable(_$BookFormatEnumMap, json['format']),
      language: $enumDecodeNullable(_$BookLanguageEnumMap, json['language']),
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OrderLineModelToJson(_OrderLineModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'quantity': instance.quantity,
      'unitPriceBdt': instance.unitPriceBdt,
      'format': _$BookFormatEnumMap[instance.format],
      'language': _$BookLanguageEnumMap[instance.language],
      'coverSeed': instance.coverSeed,
    };

const _$BookFormatEnumMap = {
  BookFormat.paperback: 'paperback',
  BookFormat.hardcover: 'hardcover',
  BookFormat.ebook: 'ebook',
};

const _$BookLanguageEnumMap = {
  BookLanguage.bangla: 'bangla',
  BookLanguage.english: 'english',
  BookLanguage.arabic: 'arabic',
};

_StatusChangeModel _$StatusChangeModelFromJson(Map<String, dynamic> json) =>
    _StatusChangeModel(
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      at: DateTime.parse(json['at'] as String),
    );

Map<String, dynamic> _$StatusChangeModelToJson(_StatusChangeModel instance) =>
    <String, dynamic>{
      'status': _$OrderStatusEnumMap[instance.status]!,
      'at': instance.at.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.placed: 'placed',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.packed: 'packed',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

_ReturnRequestModel _$ReturnRequestModelFromJson(Map<String, dynamic> json) =>
    _ReturnRequestModel(
      reason: $enumDecode(_$ReturnReasonEnumMap, json['reason']),
      status: $enumDecode(_$ReturnStatusEnumMap, json['status']),
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$ReturnRequestModelToJson(_ReturnRequestModel instance) =>
    <String, dynamic>{
      'reason': _$ReturnReasonEnumMap[instance.reason]!,
      'status': _$ReturnStatusEnumMap[instance.status]!,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'note': instance.note,
    };

const _$ReturnReasonEnumMap = {
  ReturnReason.damaged: 'damaged',
  ReturnReason.wrongBook: 'wrongBook',
  ReturnReason.other: 'other',
};

const _$ReturnStatusEnumMap = {
  ReturnStatus.requested: 'requested',
  ReturnStatus.approved: 'approved',
  ReturnStatus.rejected: 'rejected',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_back_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellBackBookModel _$SellBackBookModelFromJson(Map<String, dynamic> json) =>
    _SellBackBookModel(
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      newPriceBdt: (json['newPriceBdt'] as num).toInt(),
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SellBackBookModelToJson(_SellBackBookModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'newPriceBdt': instance.newPriceBdt,
      'coverSeed': instance.coverSeed,
    };

_SellBackModel _$SellBackModelFromJson(Map<String, dynamic> json) =>
    _SellBackModel(
      id: json['id'] as String,
      book: SellBackBookModel.fromJson(json['book'] as Map<String, dynamic>),
      condition: $enumDecode(_$BookConditionEnumMap, json['condition']),
      quoteBdt: (json['quoteBdt'] as num).toInt(),
      status: $enumDecode(_$SellBackStatusEnumMap, json['status']),
      pickupAddress: json['pickupAddress'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      flags: (json['flags'] as num?)?.toInt() ?? 0,
      gradedCondition: $enumDecodeNullable(
        _$BookConditionEnumMap,
        json['gradedCondition'],
      ),
      paidBdt: (json['paidBdt'] as num?)?.toInt(),
      readerName: json['readerName'] as String?,
    );

Map<String, dynamic> _$SellBackModelToJson(_SellBackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book': instance.book.toJson(),
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'quoteBdt': instance.quoteBdt,
      'status': _$SellBackStatusEnumMap[instance.status]!,
      'pickupAddress': instance.pickupAddress,
      'createdAt': instance.createdAt.toIso8601String(),
      'flags': instance.flags,
      'gradedCondition': _$BookConditionEnumMap[instance.gradedCondition],
      'paidBdt': instance.paidBdt,
      'readerName': instance.readerName,
    };

const _$BookConditionEnumMap = {
  BookCondition.likeNew: 'likeNew',
  BookCondition.veryGood: 'veryGood',
  BookCondition.good: 'good',
  BookCondition.acceptable: 'acceptable',
};

const _$SellBackStatusEnumMap = {
  SellBackStatus.scheduled: 'scheduled',
  SellBackStatus.pickedUp: 'pickedUp',
  SellBackStatus.paid: 'paid',
  SellBackStatus.returned: 'returned',
};

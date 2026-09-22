// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: json['id'] as String,
  title: json['title'] as String,
  author: json['author'] as String,
  priceBdt: (json['priceBdt'] as num).toInt(),
  vendor: json['vendor'] as String,
  vendorCount: (json['vendorCount'] as num?)?.toInt() ?? 1,
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  isBeneficial: json['isBeneficial'] as bool? ?? false,
  isBestValue: json['isBestValue'] as bool? ?? false,
  coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
  originalPriceBdt: (json['originalPriceBdt'] as num?)?.toInt(),
  shortTitle: json['shortTitle'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'priceBdt': instance.priceBdt,
  'vendor': instance.vendor,
  'vendorCount': instance.vendorCount,
  'rating': instance.rating,
  'tags': instance.tags,
  'isBeneficial': instance.isBeneficial,
  'isBestValue': instance.isBestValue,
  'coverSeed': instance.coverSeed,
  'originalPriceBdt': instance.originalPriceBdt,
  'shortTitle': instance.shortTitle,
  'category': instance.category,
};

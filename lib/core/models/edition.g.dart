// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Edition _$EditionFromJson(Map<String, dynamic> json) => _Edition(
  id: json['id'] as String,
  format: $enumDecode(_$BookFormatEnumMap, json['format']),
  language: $enumDecode(_$BookLanguageEnumMap, json['language']),
  priceBdt: (json['priceBdt'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  listPriceBdt: (json['listPriceBdt'] as num?)?.toInt(),
  isPreorder: json['isPreorder'] as bool? ?? false,
  isbn: json['isbn'] as String?,
);

Map<String, dynamic> _$EditionToJson(_Edition instance) => <String, dynamic>{
  'id': instance.id,
  'format': _$BookFormatEnumMap[instance.format]!,
  'language': _$BookLanguageEnumMap[instance.language]!,
  'priceBdt': instance.priceBdt,
  'stock': instance.stock,
  'listPriceBdt': instance.listPriceBdt,
  'isPreorder': instance.isPreorder,
  'isbn': instance.isbn,
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

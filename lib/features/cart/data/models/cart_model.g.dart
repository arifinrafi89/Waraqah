// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartLineModel _$CartLineModelFromJson(Map<String, dynamic> json) =>
    _CartLineModel(
      id: json['id'] as String,
      kind: $enumDecode(_$CartItemKindEnumMap, json['kind']),
      itemId: json['itemId'] as String,
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      unitPriceBdt: (json['unitPriceBdt'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      maxQuantity: (json['maxQuantity'] as num).toInt(),
      listPriceBdt: (json['listPriceBdt'] as num?)?.toInt(),
      format: $enumDecodeNullable(_$BookFormatEnumMap, json['format']),
      language: $enumDecodeNullable(_$BookLanguageEnumMap, json['language']),
      isPreorder: json['isPreorder'] as bool? ?? false,
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CartLineModelToJson(_CartLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$CartItemKindEnumMap[instance.kind]!,
      'itemId': instance.itemId,
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'unitPriceBdt': instance.unitPriceBdt,
      'quantity': instance.quantity,
      'maxQuantity': instance.maxQuantity,
      'listPriceBdt': instance.listPriceBdt,
      'format': _$BookFormatEnumMap[instance.format],
      'language': _$BookLanguageEnumMap[instance.language],
      'isPreorder': instance.isPreorder,
      'coverSeed': instance.coverSeed,
    };

const _$CartItemKindEnumMap = {
  CartItemKind.edition: 'edition',
  CartItemKind.certifiedUsed: 'certifiedUsed',
  CartItemKind.listing: 'listing',
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

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
  lines:
      (json['lines'] as List<dynamic>?)
          ?.map((e) => CartLineModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CartLineModel>[],
);

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{'lines': instance.lines.map((e) => e.toJson()).toList()};

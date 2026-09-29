// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VendorOffer _$VendorOfferFromJson(Map<String, dynamic> json) => _VendorOffer(
  vendor: json['vendor'] as String,
  priceBdt: (json['priceBdt'] as num).toInt(),
  format:
      $enumDecodeNullable(_$BookFormatEnumMap, json['format']) ??
      BookFormat.paperback,
  deliveryDays: (json['deliveryDays'] as num?)?.toInt() ?? 3,
  inStock: json['inStock'] as bool? ?? true,
);

Map<String, dynamic> _$VendorOfferToJson(_VendorOffer instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'priceBdt': instance.priceBdt,
      'format': _$BookFormatEnumMap[instance.format]!,
      'deliveryDays': instance.deliveryDays,
      'inStock': instance.inStock,
    };

const _$BookFormatEnumMap = {
  BookFormat.paperback: 'paperback',
  BookFormat.hardcover: 'hardcover',
  BookFormat.ebook: 'ebook',
};

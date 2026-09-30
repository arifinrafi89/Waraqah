// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => _CouponModel(
  code: json['code'] as String,
  kind: $enumDecode(_$CouponKindEnumMap, json['kind']),
  value: (json['value'] as num?)?.toInt() ?? 0,
  minOrderBdt: (json['minOrderBdt'] as num?)?.toInt() ?? 0,
  maxDiscountBdt: (json['maxDiscountBdt'] as num?)?.toInt(),
);

Map<String, dynamic> _$CouponModelToJson(_CouponModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'kind': _$CouponKindEnumMap[instance.kind]!,
      'value': instance.value,
      'minOrderBdt': instance.minOrderBdt,
      'maxDiscountBdt': instance.maxDiscountBdt,
    };

const _$CouponKindEnumMap = {
  CouponKind.percentOff: 'percentOff',
  CouponKind.amountOff: 'amountOff',
  CouponKind.freeDelivery: 'freeDelivery',
};

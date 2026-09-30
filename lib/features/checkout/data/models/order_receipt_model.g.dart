// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderReceiptModel _$OrderReceiptModelFromJson(Map<String, dynamic> json) =>
    _OrderReceiptModel(
      number: json['number'] as String,
      totalBdt: (json['totalBdt'] as num).toInt(),
      itemCount: (json['itemCount'] as num).toInt(),
      payment: $enumDecode(_$PaymentMethodEnumMap, json['payment']),
      needsDelivery: json['needsDelivery'] as bool,
      insideDhaka: json['insideDhaka'] as bool,
      hasPreorders: json['hasPreorders'] as bool? ?? false,
      pointsEarned: (json['pointsEarned'] as num?)?.toInt() ?? 0,
      giftFor: json['giftFor'] as String?,
    );

Map<String, dynamic> _$OrderReceiptModelToJson(_OrderReceiptModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'totalBdt': instance.totalBdt,
      'itemCount': instance.itemCount,
      'payment': _$PaymentMethodEnumMap[instance.payment]!,
      'needsDelivery': instance.needsDelivery,
      'insideDhaka': instance.insideDhaka,
      'hasPreorders': instance.hasPreorders,
      'pointsEarned': instance.pointsEarned,
      'giftFor': instance.giftFor,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.bkash: 'bkash',
  PaymentMethod.nagad: 'nagad',
  PaymentMethod.cashOnDelivery: 'cashOnDelivery',
  PaymentMethod.card: 'card',
};

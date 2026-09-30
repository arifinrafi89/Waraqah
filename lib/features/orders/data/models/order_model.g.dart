// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  number: json['number'] as String,
  placedAt: DateTime.parse(json['placedAt'] as String),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  lines: (json['lines'] as List<dynamic>)
      .map((e) => OrderLineModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  history: (json['history'] as List<dynamic>)
      .map((e) => StatusChangeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  addressLabel: json['addressLabel'] as String,
  addressLine: json['addressLine'] as String,
  payment: $enumDecode(_$PaymentMethodEnumMap, json['payment']),
  subtotalBdt: (json['subtotalBdt'] as num).toInt(),
  deliveryFeeBdt: (json['deliveryFeeBdt'] as num).toInt(),
  discountBdt: (json['discountBdt'] as num).toInt(),
  totalBdt: (json['totalBdt'] as num).toInt(),
  needsDelivery: json['needsDelivery'] as bool? ?? true,
  returnRequest: json['returnRequest'] == null
      ? null
      : ReturnRequestModel.fromJson(
          json['returnRequest'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'placedAt': instance.placedAt.toIso8601String(),
      'status': _$OrderStatusEnumMap[instance.status]!,
      'lines': instance.lines.map((e) => e.toJson()).toList(),
      'history': instance.history.map((e) => e.toJson()).toList(),
      'addressLabel': instance.addressLabel,
      'addressLine': instance.addressLine,
      'payment': _$PaymentMethodEnumMap[instance.payment]!,
      'subtotalBdt': instance.subtotalBdt,
      'deliveryFeeBdt': instance.deliveryFeeBdt,
      'discountBdt': instance.discountBdt,
      'totalBdt': instance.totalBdt,
      'needsDelivery': instance.needsDelivery,
      'returnRequest': instance.returnRequest?.toJson(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.placed: 'placed',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.packed: 'packed',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.bkash: 'bkash',
  PaymentMethod.nagad: 'nagad',
  PaymentMethod.cashOnDelivery: 'cashOnDelivery',
  PaymentMethod.card: 'card',
};

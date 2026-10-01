// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PayoutModel _$PayoutModelFromJson(Map<String, dynamic> json) => _PayoutModel(
  amountBdt: (json['amountBdt'] as num).toInt(),
  at: DateTime.parse(json['at'] as String),
);

Map<String, dynamic> _$PayoutModelToJson(_PayoutModel instance) =>
    <String, dynamic>{
      'amountBdt': instance.amountBdt,
      'at': instance.at.toIso8601String(),
    };

_EarningsModel _$EarningsModelFromJson(Map<String, dynamic> json) =>
    _EarningsModel(
      heldBdt: (json['heldBdt'] as num).toInt(),
      earnedBdt: (json['earnedBdt'] as num).toInt(),
      paidOutBdt: (json['paidOutBdt'] as num).toInt(),
      payouts:
          (json['payouts'] as List<dynamic>?)
              ?.map((e) => PayoutModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PayoutModel>[],
    );

Map<String, dynamic> _$EarningsModelToJson(_EarningsModel instance) =>
    <String, dynamic>{
      'heldBdt': instance.heldBdt,
      'earnedBdt': instance.earnedBdt,
      'paidOutBdt': instance.paidOutBdt,
      'payouts': instance.payouts.map((e) => e.toJson()).toList(),
    };

_SaleDisputeModel _$SaleDisputeModelFromJson(Map<String, dynamic> json) =>
    _SaleDisputeModel(
      sale: HandledSaleModel.fromJson(json['sale'] as Map<String, dynamic>),
      buyerName: json['buyerName'] as String,
      sellerName: json['sellerName'] as String,
    );

Map<String, dynamic> _$SaleDisputeModelToJson(_SaleDisputeModel instance) =>
    <String, dynamic>{
      'sale': instance.sale.toJson(),
      'buyerName': instance.buyerName,
      'sellerName': instance.sellerName,
    };

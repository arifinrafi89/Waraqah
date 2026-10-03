// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletEntryModel _$WalletEntryModelFromJson(Map<String, dynamic> json) =>
    _WalletEntryModel(
      amountBdt: (json['amountBdt'] as num).toInt(),
      reason: $enumDecode(_$WalletReasonEnumMap, json['reason']),
      at: DateTime.parse(json['at'] as String),
      orderNumber: json['orderNumber'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$WalletEntryModelToJson(_WalletEntryModel instance) =>
    <String, dynamic>{
      'amountBdt': instance.amountBdt,
      'reason': _$WalletReasonEnumMap[instance.reason]!,
      'at': instance.at.toIso8601String(),
      'orderNumber': instance.orderNumber,
      'note': instance.note,
    };

const _$WalletReasonEnumMap = {
  WalletReason.cancelRefund: 'cancelRefund',
  WalletReason.returnRefund: 'returnRefund',
  WalletReason.saleRefund: 'saleRefund',
  WalletReason.sellBack: 'sellBack',
  WalletReason.spent: 'spent',
};

_WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => _WalletModel(
  balanceBdt: (json['balanceBdt'] as num?)?.toInt() ?? 0,
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map((e) => WalletEntryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WalletEntryModel>[],
);

Map<String, dynamic> _$WalletModelToJson(_WalletModel instance) =>
    <String, dynamic>{
      'balanceBdt': instance.balanceBdt,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };

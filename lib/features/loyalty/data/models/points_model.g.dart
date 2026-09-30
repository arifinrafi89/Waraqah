// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PointsEntryModel _$PointsEntryModelFromJson(Map<String, dynamic> json) =>
    _PointsEntryModel(
      points: (json['points'] as num).toInt(),
      reason: $enumDecode(_$PointsReasonEnumMap, json['reason']),
      at: DateTime.parse(json['at'] as String),
      orderNumber: json['orderNumber'] as String?,
    );

Map<String, dynamic> _$PointsEntryModelToJson(_PointsEntryModel instance) =>
    <String, dynamic>{
      'points': instance.points,
      'reason': _$PointsReasonEnumMap[instance.reason]!,
      'at': instance.at.toIso8601String(),
      'orderNumber': instance.orderNumber,
    };

const _$PointsReasonEnumMap = {
  PointsReason.welcome: 'welcome',
  PointsReason.earned: 'earned',
  PointsReason.spent: 'spent',
  PointsReason.refunded: 'refunded',
  PointsReason.reversed: 'reversed',
};

_PointsAccountModel _$PointsAccountModelFromJson(Map<String, dynamic> json) =>
    _PointsAccountModel(
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => PointsEntryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PointsEntryModel>[],
    );

Map<String, dynamic> _$PointsAccountModelToJson(_PointsAccountModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };

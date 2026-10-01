// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReorderResultModel _$ReorderResultModelFromJson(Map<String, dynamic> json) =>
    _ReorderResultModel(
      added: (json['added'] as num?)?.toInt() ?? 0,
      skipped: (json['skipped'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReorderResultModelToJson(_ReorderResultModel instance) =>
    <String, dynamic>{'added': instance.added, 'skipped': instance.skipped};

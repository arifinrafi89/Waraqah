// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditEntryModel _$AuditEntryModelFromJson(Map<String, dynamic> json) =>
    _AuditEntryModel(
      id: json['id'] as String,
      at: DateTime.parse(json['at'] as String),
      by: json['by'] as String,
      action: $enumDecode(_$AuditActionEnumMap, json['action']),
      subject: json['subject'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$AuditEntryModelToJson(_AuditEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'at': instance.at.toIso8601String(),
      'by': instance.by,
      'action': _$AuditActionEnumMap[instance.action]!,
      'subject': instance.subject,
      'reason': instance.reason,
    };

const _$AuditActionEnumMap = {
  AuditAction.approved: 'approved',
  AuditAction.changesRequested: 'changesRequested',
  AuditAction.rejected: 'rejected',
  AuditAction.removed: 'removed',
  AuditAction.dismissed: 'dismissed',
  AuditAction.warned: 'warned',
  AuditAction.banned: 'banned',
};

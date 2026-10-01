// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentReportModel _$ContentReportModelFromJson(Map<String, dynamic> json) =>
    _ContentReportModel(
      id: json['id'] as String,
      kind: $enumDecode(_$ReportTargetKindEnumMap, json['kind']),
      targetId: json['targetId'] as String,
      reason: $enumDecode(_$ReportReasonEnumMap, json['reason']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status:
          $enumDecodeNullable(_$ReportStatusEnumMap, json['status']) ??
          ReportStatus.open,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ContentReportModelToJson(_ContentReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$ReportTargetKindEnumMap[instance.kind]!,
      'targetId': instance.targetId,
      'reason': _$ReportReasonEnumMap[instance.reason]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$ReportStatusEnumMap[instance.status]!,
      'note': instance.note,
    };

const _$ReportTargetKindEnumMap = {
  ReportTargetKind.listing: 'listing',
  ReportTargetKind.user: 'user',
  ReportTargetKind.message: 'message',
  ReportTargetKind.bite: 'bite',
  ReportTargetKind.comment: 'comment',
  ReportTargetKind.review: 'review',
};

const _$ReportReasonEnumMap = {
  ReportReason.spam: 'spam',
  ReportReason.fake: 'fake',
  ReportReason.photocopy: 'photocopy',
  ReportReason.harassment: 'harassment',
  ReportReason.offensive: 'offensive',
  ReportReason.other: 'other',
};

const _$ReportStatusEnumMap = {
  ReportStatus.open: 'open',
  ReportStatus.removed: 'removed',
  ReportStatus.dismissed: 'dismissed',
  ReportStatus.warned: 'warned',
  ReportStatus.banned: 'banned',
};

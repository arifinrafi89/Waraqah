// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModerationReportModel _$ModerationReportModelFromJson(
  Map<String, dynamic> json,
) => _ModerationReportModel(
  id: json['id'] as String,
  kind: $enumDecode(_$ReportTargetKindEnumMap, json['kind']),
  targetId: json['targetId'] as String,
  reason: $enumDecode(_$ReportReasonEnumMap, json['reason']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  preview: json['preview'] as String,
  ownerId: json['ownerId'] as String,
  ownerName: json['ownerName'] as String,
  reportCount: (json['reportCount'] as num?)?.toInt() ?? 1,
  ownerStrikes: (json['ownerStrikes'] as num?)?.toInt() ?? 0,
  ownerBanned: json['ownerBanned'] as bool? ?? false,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ModerationReportModelToJson(
  _ModerationReportModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'kind': _$ReportTargetKindEnumMap[instance.kind]!,
  'targetId': instance.targetId,
  'reason': _$ReportReasonEnumMap[instance.reason]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'preview': instance.preview,
  'ownerId': instance.ownerId,
  'ownerName': instance.ownerName,
  'reportCount': instance.reportCount,
  'ownerStrikes': instance.ownerStrikes,
  'ownerBanned': instance.ownerBanned,
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

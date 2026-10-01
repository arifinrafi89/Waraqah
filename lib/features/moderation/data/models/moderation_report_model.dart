import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../report/domain/entities/content_report.dart';
import '../../domain/entities/moderation_report.dart';

part 'moderation_report_model.freezed.dart';
part 'moderation_report_model.g.dart';

/// JSON shape of a [ModerationReport].
@freezed
abstract class ModerationReportModel with _$ModerationReportModel {
  const factory ModerationReportModel({
    required String id,
    required ReportTargetKind kind,
    required String targetId,
    required ReportReason reason,
    required DateTime createdAt,
    required String preview,
    required String ownerId,
    required String ownerName,
    @Default(1) int reportCount,
    @Default(0) int ownerStrikes,
    @Default(false) bool ownerBanned,
    String? note,
  }) = _ModerationReportModel;

  factory ModerationReportModel.fromJson(Map<String, dynamic> json) =>
      _$ModerationReportModelFromJson(json);
}

extension ModerationReportModelX on ModerationReportModel {
  ModerationReport toEntity() => ModerationReport(
    id: id,
    target: ReportTarget(kind: kind, id: targetId),
    reason: reason,
    createdAt: createdAt,
    preview: preview,
    ownerId: ownerId,
    ownerName: ownerName,
    reportCount: reportCount,
    ownerStrikes: ownerStrikes,
    ownerBanned: ownerBanned,
    note: note,
  );
}

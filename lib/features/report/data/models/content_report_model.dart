import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/content_report.dart';

part 'content_report_model.freezed.dart';
part 'content_report_model.g.dart';

/// JSON shape of a [ContentReport].
@freezed
abstract class ContentReportModel with _$ContentReportModel {
  const factory ContentReportModel({
    required String id,
    required ReportTargetKind kind,
    required String targetId,
    required ReportReason reason,
    required DateTime createdAt,
    @Default(ReportStatus.open) ReportStatus status,
    String? note,

    /// Who sent it. Only the server and moderators see this.
    @JsonKey(includeToJson: false) @Default('me') String reporterId,
  }) = _ContentReportModel;

  factory ContentReportModel.fromJson(Map<String, dynamic> json) =>
      _$ContentReportModelFromJson(json);
}

extension ContentReportModelX on ContentReportModel {
  ContentReport toEntity() => ContentReport(
    id: id,
    target: ReportTarget(kind: kind, id: targetId),
    reason: reason,
    createdAt: createdAt,
    status: status,
    note: note,
  );
}

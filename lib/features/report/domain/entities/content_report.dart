import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_report.freezed.dart';

/// What can be reported. Every kind lands in the one Moderation Center.
enum ReportTargetKind { listing, user, message, bite, comment, review }

/// Why a reader reports something.
enum ReportReason { spam, fake, photocopy, harassment, offensive, other }

/// Where a report is. Moderators take it from [open] to one of the others.
enum ReportStatus { open, removed, dismissed, warned, banned }

/// One thing a reader can report: a Listing, a reader, a message, a Bite,
/// a comment or a review, by its id.
@freezed
abstract class ReportTarget with _$ReportTarget {
  const factory ReportTarget({
    required ReportTargetKind kind,
    required String id,
  }) = _ReportTarget;
}

/// What the reader sends: the target, a reason and their own words.
@freezed
abstract class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    required ReportTarget target,
    required ReportReason reason,
    String? note,
  }) = _ReportRequest;
}

/// A report as the server keeps it, waiting for a moderator.
@freezed
abstract class ContentReport with _$ContentReport {
  const factory ContentReport({
    required String id,
    required ReportTarget target,
    required ReportReason reason,
    required DateTime createdAt,
    @Default(ReportStatus.open) ReportStatus status,
    String? note,
  }) = _ContentReport;
}

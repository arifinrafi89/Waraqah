import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../report/domain/entities/content_report.dart';

part 'moderation_report.freezed.dart';

/// What a moderator does with a report. Every one ends it.
enum ReportAction { remove, dismiss, warn, ban }

/// Open reports about one thing, as a moderator sees them: what was
/// reported, whose it is, and that person's strikes.
@freezed
abstract class ModerationReport with _$ModerationReport {
  const factory ModerationReport({
    /// The oldest open report; acting on it ends them all.
    required String id,
    required ReportTarget target,
    required ReportReason reason,
    required DateTime createdAt,

    /// The reported words, title or name.
    required String preview,
    required String ownerId,
    required String ownerName,
    @Default(1) int reportCount,
    @Default(0) int ownerStrikes,
    @Default(false) bool ownerBanned,
    String? note,
  }) = _ModerationReport;
}

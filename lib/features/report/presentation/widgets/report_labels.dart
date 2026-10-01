import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/content_report.dart';
import '../../domain/entities/report_rules.dart';

/// Reader-facing words for reports, in the current language.
extension ReportLabels on AppL10n {
  String reportTitle(ReportTargetKind kind) => switch (kind) {
    ReportTargetKind.listing => reportTitleListing,
    ReportTargetKind.user => reportTitleUser,
    ReportTargetKind.message => reportTitleMessage,
    ReportTargetKind.bite => reportTitleBite,
    ReportTargetKind.comment => reportTitleComment,
    ReportTargetKind.review => reportTitleReview,
  };

  String reportReason(ReportReason reason) => switch (reason) {
    ReportReason.spam => reportReasonSpam,
    ReportReason.fake => reportReasonFake,
    ReportReason.photocopy => reportReasonPhotocopy,
    ReportReason.harassment => reportReasonHarassment,
    ReportReason.offensive => reportReasonOffensive,
    ReportReason.other => reportReasonOther,
  };

  String? reportProblem(ReportProblem? problem) => switch (problem) {
    ReportProblem.noteRequired => reportNoteRequired,
    ReportProblem.tooLong => reportNoteTooLong(ReportRules.maxNote),
    null => null,
  };
}

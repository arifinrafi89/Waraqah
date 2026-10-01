import '../../../report/data/models/content_report_model.dart';
import '../../../report/domain/entities/content_report.dart';
import 'moderation_fake_store.dart';

/// Reports other readers already sent, so the Reports tab has work.
void seedReports(ModerationFakeStore store) {
  final now = store.now();
  ContentReportModel report(
    String id,
    ReportTargetKind kind,
    String targetId,
    ReportReason reason,
    String reporterId,
    Duration ago, [
    String? note,
  ]) => ContentReportModel(
    id: id,
    kind: kind,
    targetId: targetId,
    reason: reason,
    createdAt: now.subtract(ago),
    note: note,
    reporterId: reporterId,
  );
  store.reports.reports.addAll([
    report(
      'rp-s1',
      ReportTargetKind.listing,
      'p2p-6',
      ReportReason.photocopy,
      'p-arif',
      const Duration(hours: 3),
      'The pages look photocopied in the photos.',
    ),
    report(
      'rp-s2',
      ReportTargetKind.listing,
      'p2p-6',
      ReportReason.fake,
      'p-nabila',
      const Duration(hours: 2),
    ),
    report(
      'rp-s3',
      ReportTargetKind.user,
      'p-rafi',
      ReportReason.harassment,
      'p-sadia',
      const Duration(days: 1),
      'Kept messaging after I said no.',
    ),
    report(
      'rp-s4',
      ReportTargetKind.bite,
      'bt-3',
      ReportReason.spam,
      'p-mahi',
      const Duration(hours: 5),
    ),
  ]);
}

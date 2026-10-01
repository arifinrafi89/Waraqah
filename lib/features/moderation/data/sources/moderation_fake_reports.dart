// Acting on a report changes the reports readers sent and, for a removed
// Listing, the marketplace.
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../report/data/models/content_report_model.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../domain/entities/audit_entry.dart';
import '../../domain/entities/moderation_report.dart';
import '../models/moderation_report_model.dart';
import 'moderation_fake_store.dart';

/// Open reports, one card per reported thing, and what moderators do.
extension ModerationFakeReports on ModerationFakeStore {
  List<ContentReportModel> get _open => [
    for (final r in reports.reports)
      if (r.status == ReportStatus.open) r,
  ]..sort((a, b) => a.createdAt.compareTo(b.createdAt));

  List<Map<String, dynamic>> openReportsJson() {
    final firsts = <String, ContentReportModel>{};
    final counts = <String, int>{};
    for (final r in _open) {
      final key = '${r.kind.name}:${r.targetId}';
      firsts.putIfAbsent(key, () => r);
      counts[key] = (counts[key] ?? 0) + 1;
    }
    return [
      for (final MapEntry(:key, value: r) in firsts.entries)
        _json(r, counts[key]!),
    ];
  }

  Map<String, dynamic> _json(ContentReportModel r, int count) {
    final subject = subjects.find(r.kind, r.targetId);
    return ModerationReportModel(
      id: r.id,
      kind: r.kind,
      targetId: r.targetId,
      reason: r.reason,
      createdAt: r.createdAt,
      preview: subject.preview,
      ownerId: subject.ownerId,
      ownerName: subject.ownerName,
      reportCount: count,
      ownerStrikes: strikes[subject.ownerId] ?? 0,
      ownerBanned: isBanned(subject.ownerId),
      note: r.note,
    ).toJson();
  }

  /// `false` when the report isn't open, or there's nobody to warn or ban.
  bool act(String reportId, ReportAction action, String by) {
    final report = _open.where((r) => r.id == reportId).firstOrNull;
    if (report == null) return false;
    final subject = subjects.find(report.kind, report.targetId);
    final owner = subject.ownerId;
    final punishes = action == ReportAction.warn || action == ReportAction.ban;
    if (punishes && owner.isEmpty) return false;
    final why = report.reason.name;
    final label = switch (report.kind) {
      ReportTargetKind.listing || ReportTargetKind.user => subject.preview,
      _ => '${subject.ownerName}: “${subject.preview}”',
    };
    var status = ReportStatus.dismissed;
    switch (action) {
      case ReportAction.dismiss:
        record(by, AuditAction.dismissed, label, why);
      case ReportAction.remove:
        status = ReportStatus.removed;
        if (report.kind == ReportTargetKind.listing) {
          p2p.moderate(
            report.targetId,
            P2pListingStatus.rejected,
            reason: 'Removed after a report: $why',
          );
        }
        record(by, AuditAction.removed, label, why);
      case ReportAction.warn:
        status = ReportStatus.warned;
        warn(owner);
        record(by, AuditAction.warned, subject.ownerName, why);
        if (isBanned(owner)) {
          status = ReportStatus.banned;
          record(by, AuditAction.banned, subject.ownerName, 'strikes');
        }
      case ReportAction.ban:
        status = ReportStatus.banned;
        ban(owner);
        record(by, AuditAction.banned, subject.ownerName, why);
    }
    _close(report, status);
    return true;
  }

  /// Ends every open report about the same thing.
  void _close(ContentReportModel report, ReportStatus status) {
    final list = reports.reports;
    for (var i = 0; i < list.length; i++) {
      final r = list[i];
      if (r.status == ReportStatus.open &&
          r.kind == report.kind &&
          r.targetId == report.targetId) {
        list[i] = r.copyWith(status: status);
      }
    }
  }
}

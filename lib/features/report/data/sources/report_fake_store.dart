// The fake backend checks reported Listings and readers against the
// marketplace's own records, like the real server will.
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/content_report.dart';
import '../../domain/entities/report_rules.dart';
import '../models/blocked_reader_model.dart';
import '../models/content_report_model.dart';

/// Reports waiting for the Moderation Center, and who the signed-in reader
/// ([P2pPeople.me]) blocked. The marketplace hides blocked sellers.
class ReportFakeStore {
  ReportFakeStore(this.p2p, {DateTime Function()? clock})
    : now = clock ?? DateTime.now;

  final P2pFakeStore p2p;
  final DateTime Function() now;
  final List<ContentReportModel> reports = [];
  final Map<String, DateTime> _blocked = {};
  int _ids = 0;

  bool isBlocked(String readerId) => _blocked.containsKey(readerId);

  /// The new report, the reader's earlier open one on the same target, or
  /// `null` when it can't be reported (unknown, or the reader's own).
  ContentReportModel? report(
    ReportTargetKind kind,
    String targetId,
    ReportReason reason,
    String? note,
  ) {
    if (!_canReport(kind, targetId) ||
        ReportRules.check(reason, note) != null) {
      return null;
    }
    final earlier = reports
        .where(
          (r) =>
              r.kind == kind &&
              r.targetId == targetId &&
              r.reporterId == P2pPeople.me &&
              r.status == ReportStatus.open,
        )
        .firstOrNull;
    if (earlier != null) return earlier;
    final report = ContentReportModel(
      id: 'rp-${++_ids}',
      kind: kind,
      targetId: targetId,
      reason: reason,
      createdAt: now(),
      note: note,
    );
    reports.add(report);
    return report;
  }

  bool _canReport(ReportTargetKind kind, String id) => switch (kind) {
    ReportTargetKind.listing =>
      p2p.find(id) != null && p2p.find(id)!.sellerId != P2pPeople.me,
    ReportTargetKind.user => P2pPeople.find(id) != null && id != P2pPeople.me,
    _ => id.isNotEmpty,
  };

  /// `false` for the reader themselves or someone unknown.
  bool block(String readerId) {
    if (readerId == P2pPeople.me || P2pPeople.find(readerId) == null) {
      return false;
    }
    _blocked.putIfAbsent(readerId, now);
    return true;
  }

  void unblock(String readerId) => _blocked.remove(readerId);

  /// Newest first.
  List<Map<String, dynamic>> blockedJson() {
    final entries = _blocked.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return [
      for (final entry in entries)
        BlockedReaderModel(
          id: entry.key,
          name: P2pPeople.find(entry.key)!.name,
          blockedAt: entry.value,
        ).toJson(),
    ];
  }
}

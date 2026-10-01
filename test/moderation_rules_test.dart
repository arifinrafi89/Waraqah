import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/moderation/data/sources/moderation_fake_reports.dart';
import 'package:waraqah/features/moderation/data/sources/moderation_fake_store.dart';
import 'package:waraqah/features/moderation/domain/entities/audit_entry.dart';
import 'package:waraqah/features/moderation/domain/entities/moderation_report.dart';
import 'package:waraqah/features/moderation/domain/entities/moderation_rules.dart';
import 'package:waraqah/features/moderation/domain/entities/queued_listing.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_api.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_store.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';
import 'package:waraqah/features/report/data/sources/report_fake_store.dart';
import 'package:waraqah/features/report/domain/entities/content_report.dart';

ModerationFakeStore _store() {
  final p2p = P2pFakeStore();
  return ModerationFakeStore(p2p, ReportFakeStore(p2p));
}

String _reportOn(ModerationFakeStore store, String targetId) =>
    store.openReportsJson().firstWhere((r) => r['targetId'] == targetId)['id']
        as String;

void main() {
  test('asking for changes and rejecting need a short reason', () {
    final approve = ListingDecision.approve;
    final reject = ListingDecision.reject;
    expect(ModerationRules.checkDecision(approve, null), isNull);
    expect(
      ModerationRules.checkDecision(reject, ' '),
      ModerationProblem.reasonRequired,
    );
    expect(
      ModerationRules.checkDecision(reject, 'x' * 301),
      ModerationProblem.reasonTooLong,
    );
    expect(ModerationRules.checkDecision(reject, 'Photocopy'), isNull);
  });

  test('the third warning bans', () {
    expect(ModerationRules.afterWarning(0), (strikes: 1, banned: false));
    expect(ModerationRules.afterWarning(2), (strikes: 3, banned: true));
  });

  test('decisions move Listings out of the queue and into the log', () {
    final store = _store();
    expect(store.queueJson(), hasLength(3));
    expect(
      store.decide('p2p-review-2', ListingDecision.reject, 'Mod', null),
      isFalse,
      reason: 'a rejection needs a reason',
    );
    expect(
      store.decide('p2p-review-2', ListingDecision.approve, 'Mod', null),
      isTrue,
    );
    store.decide('p2p-review-1', ListingDecision.requestChanges, 'Mod', 'Pics');
    expect(store.p2p.find('p2p-review-2')!.status, P2pListingStatus.live);
    final mine = store.p2p.find('p2p-review-1')!;
    expect(mine.status, P2pListingStatus.changesRequested);
    expect(mine.rejectionReason, 'Pics');
    expect(store.queueJson(), hasLength(1));
    expect(store.log.map((e) => e.action), [
      AuditAction.approved,
      AuditAction.changesRequested,
    ]);
  });

  test('reports about one thing are one case, closed together', () {
    final store = _store();
    final listing = store.openReportsJson().firstWhere(
      (r) => r['targetId'] == 'p2p-6',
    );
    expect(listing['reportCount'], 2);
    expect(listing['ownerName'], 'Mahi');

    store.act(listing['id'] as String, ReportAction.remove, 'Mod');
    expect(store.p2p.find('p2p-6')!.status, P2pListingStatus.rejected);
    expect(
      store.openReportsJson().where((r) => r['targetId'] == 'p2p-6'),
      isEmpty,
    );
    expect(
      store.reports.reports
          .where((r) => r.targetId == 'p2p-6')
          .map((r) => r.status),
      everyElement(ReportStatus.removed),
    );
  });

  test('three warnings ban a seller and hide their listings', () {
    final store = _store();
    final routes = P2pFakeApi.routes(store.p2p, isBlocked: store.isBanned);
    bool hasTanvir() => (routes[P2pFakeApi.listings]!(
      RequestOptions(path: P2pFakeApi.listings),
    ) as List).any((l) => (l as Map)['sellerId'] == 'p-tanvir');

    for (var i = 0; i < 3; i++) {
      store.reports.report(
        ReportTargetKind.user,
        'p-tanvir',
        ReportReason.spam,
        null,
      );
      expect(hasTanvir(), isTrue);
      store.act(_reportOn(store, 'p-tanvir'), ReportAction.warn, 'Mod');
    }
    expect(store.isBanned('p-tanvir'), isTrue);
    expect(hasTanvir(), isFalse);
    expect(store.log.last.action, AuditAction.banned);
  });
}

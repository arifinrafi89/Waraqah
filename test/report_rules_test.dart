import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/p2p/data/sources/p2p_fake_api.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_store.dart';
import 'package:waraqah/features/report/data/sources/report_fake_store.dart';
import 'package:waraqah/features/report/domain/entities/blocked_reader.dart';
import 'package:waraqah/features/report/domain/entities/content_report.dart';
import 'package:waraqah/features/report/domain/entities/report_rules.dart';
import 'package:waraqah/features/report/domain/repositories/report_repository.dart';
import 'package:waraqah/features/report/domain/usecases/report_content.dart';

const _listing = ReportTarget(kind: ReportTargetKind.listing, id: 'p2p-1');

void main() {
  test('"Something else" needs a note, and notes stay short', () {
    expect(ReportRules.check(ReportReason.spam, null), isNull);
    expect(
      ReportRules.check(ReportReason.other, '  '),
      ReportProblem.noteRequired,
    );
    expect(ReportRules.check(ReportReason.other, 'Sells PDFs'), isNull);
    expect(
      ReportRules.check(ReportReason.fake, 'x' * 501),
      ReportProblem.tooLong,
    );
  });

  test('only Listings can be reported as photocopies', () {
    expect(
      ReportRules.reasonsFor(ReportTargetKind.listing),
      contains(ReportReason.photocopy),
    );
    expect(
      ReportRules.reasonsFor(ReportTargetKind.message),
      isNot(contains(ReportReason.photocopy)),
    );
  });

  test('a report trims its note and refuses a broken one', () async {
    final repository = _Repository();
    final report = ReportContent(repository);
    await report(
      const ReportRequest(
        target: _listing,
        reason: ReportReason.fake,
        note: '  ',
      ),
    );
    expect(repository.sent?.note, isNull);
    expect(
      () => report(
        const ReportRequest(target: _listing, reason: ReportReason.other),
      ),
      throwsArgumentError,
    );
  });

  test("the server refuses the reader's own and unknown things", () {
    final store = ReportFakeStore(P2pFakeStore());
    final spam = ReportReason.spam;
    expect(store.report(ReportTargetKind.listing, 'p2p-7', spam, null), isNull);
    expect(store.report(ReportTargetKind.listing, 'nope', spam, null), isNull);
    expect(store.report(ReportTargetKind.user, 'me', spam, null), isNull);

    final first = store.report(ReportTargetKind.user, 'p-arif', spam, null);
    final again = store.report(ReportTargetKind.user, 'p-arif', spam, null);
    expect(again?.id, first?.id, reason: 'one report per target');
    expect(store.reports, hasLength(1));
  });

  test("blocking hides the seller's listings from the marketplace", () {
    final p2p = P2pFakeStore();
    final store = ReportFakeStore(p2p);
    final routes = P2pFakeApi.routes(p2p, isBlocked: store.isBlocked);
    List<Object?> get(String path, [Map<String, dynamic>? query]) =>
        routes[path]!(RequestOptions(path: path, queryParameters: query))
            as List<Object?>;
    bool hasTanvir(List<Object?> json) =>
        json.any((l) => (l! as Map)['sellerId'] == 'p-tanvir');

    expect(hasTanvir(get(P2pFakeApi.listings)), isTrue);
    expect(store.block('me'), isFalse);
    expect(store.block('p-tanvir'), isTrue);
    expect(hasTanvir(get(P2pFakeApi.listings)), isFalse);
    expect(get(P2pFakeApi.forBook, {'bookId': 'bk-cleancode'}), isEmpty);
    expect(store.blockedJson().single['name'], 'Tanvir');

    store.unblock('p-tanvir');
    expect(hasTanvir(get(P2pFakeApi.listings)), isTrue);
  });
}

class _Repository implements ReportRepository {
  ReportRequest? sent;

  @override
  Future<ContentReport> report(ReportRequest request) async {
    sent = request;
    return ContentReport(
      id: 'rp-1',
      target: request.target,
      reason: request.reason,
      createdAt: DateTime(2026),
      note: request.note,
    );
  }

  @override
  Future<List<BlockedReader>> blocked() async => const [];

  @override
  Future<List<BlockedReader>> block(String readerId) async => const [];

  @override
  Future<List<BlockedReader>> unblock(String readerId) async => const [];
}

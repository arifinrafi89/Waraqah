import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/inbox/data/sources/inbox_fake_api.dart';
import 'package:waraqah/features/moderation/data/sources/moderation_fake_api.dart';
import 'package:waraqah/features/report/data/sources/report_fake_api.dart';

import 'helpers/fake_backend.dart';

void main() {
  test('a message a moderator removes leaves the thread', () async {
    final backend = FakeBackend();
    Future<List<Map>> messages() async {
      final thread = (await backend.dio.get<Map<String, dynamic>>(
        InboxFakeApi.thread,
        queryParameters: {'id': 'th-sadia'},
      )).data!;
      return (thread['messages'] as List).cast<Map>();
    }

    final before = await messages();
    final theirs = before.firstWhere((m) => m['from'] == 'them');
    await backend.post(ReportFakeApi.report, {
      'kind': 'message',
      'targetId': theirs['id'],
      'reason': 'harassment',
    });
    final reports = (await backend.dio.get<List<dynamic>>(
      ModerationFakeApi.reports,
    )).data!;
    final report = reports.cast<Map>().firstWhere(
      (r) => r['targetId'] == theirs['id'],
    );
    await backend.post(ModerationFakeApi.act, {
      'reportId': report['id'],
      'action': 'remove',
      'by': 'Moderator',
    });

    final after = await messages();
    expect(after, hasLength(before.length - 1));
    expect(after.map((m) => m['id']), isNot(contains(theirs['id'])));
  });
}

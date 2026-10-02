import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_backend.dart';

void main() {
  late FakeBackend api;

  setUp(() => api = FakeBackend());

  /// Reports [id] as spam, then a moderator removes it.
  Future<void> reportAndRemove(String kind, String id) async {
    final report = await api.dio.post<Map<String, dynamic>>(
      '/reports',
      data: {'kind': kind, 'targetId': id, 'reason': 'spam'},
    );
    await api.post('/moderation/reports/act', {
      'reportId': report.data!['id'],
      'action': 'remove',
      'by': 'Mod',
    });
  }

  test('Remove deletes a reported Bite and its comments', () async {
    await reportAndRemove('bite', 'bt-1');
    final feed = await api.dio.get<List<dynamic>>('/bites');
    expect(feed.data!.map((b) => (b as Map)['id']), isNot(contains('bt-1')));
    expect(api.stores.bites.comments.where((c) => c.biteId == 'bt-1'), isEmpty);
  });

  test('Remove deletes a reported comment', () async {
    await reportAndRemove('comment', 'cm-3');
    final d = await api.dio.get<Map<String, dynamic>>(
      '/bites/detail',
      queryParameters: {'id': 'bt-1'},
    );
    final ids = (d.data!['comments'] as List).map((c) => (c as Map)['id']);
    expect(ids, ['cm-1']);
  });

  test('a reported Bite shows its author to moderators', () async {
    final reports = await api.dio.get<List<dynamic>>('/moderation/reports');
    final bite = reports.data!.cast<Map<String, dynamic>>().firstWhere(
      (r) => r['kind'] == 'bite',
    );
    expect(bite['ownerId'], 'p-rafi');
    expect(bite['ownerName'], 'Rafi');
  });
}

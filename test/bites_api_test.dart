import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_backend.dart';

void main() {
  late FakeBackend api;

  setUp(() => api = FakeBackend());

  Future<Map<String, dynamic>?> post(
    String path,
    Map<String, Object?> b,
  ) async => (await api.dio.post<Map<String, dynamic>>(path, data: b)).data;

  Future<List<Map<String, dynamic>>> feed([
    Map<String, String> q = const {},
  ]) async => [
    for (final b in (await api.dio.get<List<dynamic>>(
      '/bites',
      queryParameters: q,
    )).data!)
      b as Map<String, dynamic>,
  ];

  Future<Map<String, dynamic>> detail(String id) async =>
      (await api.dio.get<Map<String, dynamic>>(
        '/bites/detail',
        queryParameters: {'id': id},
      )).data!;

  test('post lands first; edit sets editedAt; delete takes comments', () async {
    final bite = await post('/bites/post', {
      'text': 'New one',
      'bookId': 'bk-sapiens',
      'spoiler': false,
    });
    expect(bite!['isMine'], isTrue);
    expect(bite['bookTitle'], startsWith('Sapiens'));
    expect((await feed()).first['id'], bite['id']);

    final edited = await post('/bites/edit', {
      'id': bite['id'],
      'text': 'Edited',
      'spoiler': false,
    });
    expect(edited!['text'], 'Edited');
    expect(edited['editedAt'], isNotNull);

    await post('/bites/comments/post', {'biteId': bite['id'], 'text': 'Hi'});
    expect(await post('/bites/delete', {'id': bite['id']}), isNotNull);
    expect(api.stores.bites.find(bite['id'] as String), isNull);
    expect(
      api.stores.bites.comments.where((c) => c.biteId == bite['id']),
      isEmpty,
    );
  });

  test('like toggles the count', () async {
    final liked = await post('/bites/like', {'id': 'bt-1', 'liked': true});
    expect(liked!['likes'], 4);
    expect(liked['liked'], isTrue);
    final unliked = await post('/bites/like', {'id': 'bt-1', 'liked': false});
    expect(unliked!['likes'], 3);
  });

  test('a reply to a reply lands under the top comment', () async {
    final d = await post('/bites/comments/post', {
      'biteId': 'bt-1',
      'text': 'Me too',
      'parentId': 'cm-2',
    });
    final top = (d!['comments'] as List).first as Map;
    expect(top['id'], 'cm-1');
    expect((top['replies'] as List).last['text'], 'Me too');
    expect((top['replies'] as List).last['parentId'], 'cm-1');
  });

  test('deleting a top comment deletes its replies', () async {
    final d = await post('/bites/comments/post', {
      'biteId': 'bt-1',
      'text': 'Mine',
    });
    final mine = (d!['comments'] as List).last['id'];
    await post('/bites/comments/post', {
      'biteId': 'bt-1',
      'text': 'Reply',
      'parentId': mine,
    });
    final after = await post('/bites/comments/delete', {'id': mine});
    expect(
      (after!['comments'] as List).map((c) => c['id']),
      isNot(contains(mine)),
    );
    expect(await post('/bites/comments/delete', {'id': 'cm-1'}), isNull);
  });

  test("another reader's Bite can't be edited or deleted", () async {
    expect(
      await post('/bites/edit', {'id': 'bt-1', 'text': 'x', 'spoiler': false}),
      isNull,
    );
    expect(await post('/bites/delete', {'id': 'bt-1'}), isNull);
  });

  test('a spoiler without a tag, or too long a Bite, is refused', () async {
    expect(await post('/bites/post', {'text': 'x', 'spoiler': true}), isNull);
    expect(
      await post('/bites/post', {'text': 'a' * 501, 'spoiler': false}),
      isNull,
    );
  });

  test('blocked and banned authors leave the feed', () async {
    api.stores.reports.block('p-tanvir');
    api.stores.moderation.ban('p-nabila');
    final authors = (await feed()).map((b) => b['authorId']).toSet();
    expect(authors, isNot(contains('p-tanvir')));
    expect(authors, isNot(contains('p-nabila')));
  });

  test("a banned 'me' can't post or comment", () async {
    api.stores.moderation.ban('me');
    expect(await post('/bites/post', {'text': 'Hi', 'spoiler': false}), isNull);
    expect(
      await post('/bites/comments/post', {'biteId': 'bt-1', 'text': 'Hi'}),
      isNull,
    );
  });

  test('feeds filter by book and author; detail nests replies', () async {
    expect((await feed({'bookId': 'bk-sapiens'})).single['id'], 'bt-1');
    final arif = await feed({'authorId': 'p-arif'});
    expect(arif.map((b) => b['id']), ['bt-5', 'bt-11']);
    final d = await detail('bt-1');
    expect((d['comments'] as List).length, 2);
    expect((d['bite'] as Map)['comments'], 3);
  });

  test('an unknown Bite is refused', () async {
    expect(await post('/bites/like', {'id': 'nope', 'liked': true}), isNull);
  });
}

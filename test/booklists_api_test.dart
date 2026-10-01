import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/booklist_fake_api.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_api.dart';

late Dio _dio;

Future<List<dynamic>> _all() async =>
    (await _dio.get<List<dynamic>>(BooklistFakeApi.booklists)).data!;

Future<Map<String, dynamic>?> _detail(String id) async =>
    (await _dio.get<Map<String, dynamic>>(
      BooklistFakeApi.detail,
      queryParameters: {'id': id},
    )).data;

Future<dynamic> _post(String path, Map<String, dynamic> body) async =>
    (await _dio.post<dynamic>(path, data: body)).data;

List<String> _bookIds(Map<String, dynamic> json) => [
  for (final b in json['books'] as List<dynamic>) (b as Map)['id'] as String,
];

void main() {
  setUp(() => _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor()));

  test('lists 3 Staff Booklists and the Reader\'s own', () async {
    final all = await _all();
    expect(all, hasLength(4));
    final mine = all.where((b) => (b as Map)['isMine'] == true);
    expect([for (final b in mine) (b as Map)['id']], ['bl-summer-reads']);
    expect((mine.first as Map)['kind'], 'personal');
  });

  test('an own list is made, renamed, filled and deleted', () async {
    final made = await _post(BooklistFakeApi.saveMine, {'name': ' Eid '});
    final id = (made as Map)['id'] as String;
    expect(made['titleEn'], 'Eid');
    expect(made['titleBn'], 'Eid');
    expect(made['books'], isEmpty);

    await _post(BooklistFakeApi.saveMine, {'id': id, 'name': 'Eid gifts'});
    await _post(BooklistFakeApi.saveMine, {
      'id': id,
      'bookIds': ['bk-atomic', 'bk-zero'],
    });
    final saved = await _detail(id);
    expect(saved!['titleEn'], 'Eid gifts');
    expect(_bookIds(saved), ['bk-atomic', 'bk-zero']);

    expect(await _post(BooklistFakeApi.deleteMine, {'id': id}), isNotNull);
    expect(await _detail(id), isNull);
  });

  test('a Staff list, a blank name or a repeated book is refused', () async {
    expect(
      await _post(BooklistFakeApi.saveMine, {'id': 'bl-class-8', 'name': 'x'}),
      isNull,
    );
    expect(
      await _post(BooklistFakeApi.deleteMine, {'id': 'bl-class-8'}),
      isNull,
    );
    expect(await _post(BooklistFakeApi.saveMine, {'name': '  '}), isNull);
    expect(
      await _post(BooklistFakeApi.saveMine, {
        'id': 'bl-summer-reads',
        'bookIds': ['bk-zero', 'bk-zero'],
      }),
      isNull,
    );
  });

  test('a hidden Book is left out of the detail', () async {
    await _post(CatalogAdminFakeApi.hideBook, {
      'id': 'bk-hobbit',
      'hidden': true,
    });
    final club = await _detail('bl-book-club-alchemist');
    expect(_bookIds(club!), ['bk-alchemist', 'bk-atomic']);
  });

  test('an unknown id returns null', () async {
    expect(await _detail('bl-nope'), isNull);
  });

  test('a new fake backend starts from the seed again', () async {
    await _post(BooklistFakeApi.deleteMine, {'id': 'bl-summer-reads'});
    expect(await _all(), hasLength(3));
    _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
    expect(await _all(), hasLength(4));
  });
}

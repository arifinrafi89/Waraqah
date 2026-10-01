import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/booklist_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_api.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_admin_rules.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/list_draft.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/list_rules.dart';

late Dio _dio;

Future<dynamic> _post(String path, Map<String, dynamic> body) async =>
    (await _dio.post<dynamic>(path, data: body)).data;

Future<Map<String, dynamic>?> _get(String path, String id) async =>
    (await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: {'id': id},
    )).data;

const _list = {
  'titleEn': 'Rainy days',
  'titleBn': 'বর্ষার দিন',
  'noteEn': 'Cosy reads.',
  'noteBn': 'আরামের বই।',
  'bookIds': ['bk-hobbit', 'bk-matilda'],
};

void main() {
  setUp(() => _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor()));

  test('ListRules: titles, at least one book, no repeats, short notes', () {
    const ok = ListDraft(titleEn: 'A', titleBn: 'আ', bookIds: ['bk-zero']);
    expect(ListRules.check(ok), isEmpty);
    expect(ListRules.check(ok.copyWith(titleBn: ' ')), {
      RuleError.listTitleBlank,
    });
    expect(ListRules.check(ok.copyWith(bookIds: [])), {RuleError.listNoBooks});
    expect(ListRules.check(ok.copyWith(bookIds: ['bk-zero', 'bk-zero'])), {
      RuleError.listDuplicateBook,
    });
    expect(ListRules.check(ok.copyWith(noteBn: 'ক' * 301)), {
      RuleError.listNoteTooLong,
    });
  });

  test('a Collection is made as an Expert Pick, then deleted', () async {
    final saved = await _post(CatalogAdminFakeApi.saveCollection, {
      ..._list,
      'expertId': 'exp-shirin-novelist',
      'section': 'literature',
    });
    expect(saved, {'id': 'col-rainy-days'});
    final found = await _get(CollectionFakeApi.detail, 'col-rainy-days');
    expect((found!['expert'] as Map)['name'], 'Shirin Akhter');
    expect(found['section'], 'literature');

    await _post(CatalogAdminFakeApi.deleteCollection, {'id': 'col-rainy-days'});
    expect(await _get(CollectionFakeApi.detail, 'col-rainy-days'), isNull);
  });

  test('a broken or unknown Collection is refused', () async {
    for (final bad in [
      {..._list, 'bookIds': <String>[]},
      {..._list, 'expertId': 'exp-nope'},
      {
        ..._list,
        'bookIds': ['bk-nope'],
      },
      {..._list, 'id': 'col-nope'},
    ]) {
      expect(await _post(CatalogAdminFakeApi.saveCollection, bad), isNull);
    }
  });

  test('a Staff Booklist is saved through the admin route', () async {
    final saved = await _post(CatalogAdminFakeApi.saveBooklist, {
      ..._list,
      'kind': 'bookClub',
    });
    final id = (saved as Map)['id'] as String;
    final found = await _get(BooklistFakeApi.detail, id);
    expect(found!['isMine'], false);
    expect(found['kind'], 'bookClub');

    await _post(CatalogAdminFakeApi.saveBooklist, {
      ..._list,
      'id': 'bl-class-8',
      'kind': 'classList',
      'bookIds': ['bk-english-grammar'],
    });
    final class8 = await _get(BooklistFakeApi.detail, 'bl-class-8');
    expect((class8!['books'] as List).length, 1);
  });

  test("Staff can't make a personal list or touch a Reader's", () async {
    expect(
      await _post(CatalogAdminFakeApi.saveBooklist, {
        ..._list,
        'kind': 'personal',
      }),
      isNull,
    );
    expect(
      await _post(CatalogAdminFakeApi.saveBooklist, {
        ..._list,
        'id': 'bl-summer-reads',
        'kind': 'bookClub',
      }),
      isNull,
    );
    expect(
      await _post(CatalogAdminFakeApi.deleteBooklist, {
        'id': 'bl-summer-reads',
      }),
      isNull,
    );
  });
}

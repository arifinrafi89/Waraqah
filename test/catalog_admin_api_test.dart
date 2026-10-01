import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_api.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_record.dart';
import 'package:waraqah/features/home/data/sources/home_fake_api.dart';

late Dio _dio;

Future<T?> _get<T>(
  String path, [
  Map<String, dynamic> query = const {},
]) async => (await _dio.get<T>(path, queryParameters: query)).data;

Future<dynamic> _post(String path, Map<String, dynamic> body) async =>
    (await _dio.post<dynamic>(path, data: body)).data;

Future<List<String>> _ids(
  String path, [
  Map<String, dynamic> q = const {},
]) async => [
  for (final j in (await _get<List<dynamic>>(path, q))!) (j as Map)['id'],
];

const _newBook = {
  'title': 'Shonar Tori',
  'titleBn': 'সোনার তরী',
  'authorId': 'au-harari',
  'publisherId': 'pub-harper',
  'section': 'literature',
  'categoryId': 'cat-fiction',
  'originalLanguage': 'bangla',
  'coverSeed': 4,
  'editions': [
    {
      'id': '',
      'format': 'paperback',
      'language': 'bangla',
      'priceBdt': 300,
      'stock': 5,
      'isbn': '0-306-40615-2',
    },
  ],
};

void main() {
  setUp(() => _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor()));

  test(
    'a new Book gets its ids, shows in /books and search, newest first',
    () async {
      final saved = await _post(CatalogAdminFakeApi.saveBook, _newBook) as Map;
      expect(saved['id'], 'bk-shonar-tori');
      expect(saved['author'], 'Yuval Noah Harari');
      final edition = (saved['editions'] as List).single as Map;
      expect(edition['id'], 'bk-shonar-tori-pb-bn');
      expect(edition['isbn'], '9780306406157');

      expect(await _ids(BookFakeApi.books), contains('bk-shonar-tori'));
      expect(await _ids(BookFakeApi.books, {'q': 'shonar'}), [
        'bk-shonar-tori',
      ]);
      final newest = await _ids(BookFakeApi.books, {'sort': 'newest'});
      expect(newest.first, 'bk-shonar-tori');

      final again = await _post(CatalogAdminFakeApi.saveBook, _newBook);
      expect(again, isNull, reason: 'same ISBN');
    },
  );

  test(
    'a clashing title gets -2; a wrong-Section Category is refused',
    () async {
      final noIsbn = {
        ..._newBook,
        'editions': [
          <String, dynamic>{
            ...(_newBook['editions'] as List).single as Map<String, dynamic>,
            'isbn': null,
          },
        ],
      };
      await _post(CatalogAdminFakeApi.saveBook, noIsbn);
      final second = await _post(CatalogAdminFakeApi.saveBook, noIsbn) as Map;
      expect(second['id'], 'bk-shonar-tori-2');
      final wrong = {...noIsbn, 'categoryId': 'cat-islamic-studies'};
      expect(await _post(CatalogAdminFakeApi.saveBook, wrong), isNull);
    },
  );

  test(
    'hiding leaves /books and Collections; /books/detail still answers',
    () async {
      await _post(CatalogAdminFakeApi.hideBook, {
        'id': 'bk-atomic',
        'hidden': true,
      });
      expect(await _ids(BookFakeApi.books), isNot(contains('bk-atomic')));
      final start = await _get<Map<String, dynamic>>(CollectionFakeApi.detail, {
        'id': 'col-start-here',
      });
      expect([
        for (final b in start!['books']) b['id'],
      ], isNot(contains('bk-atomic')));
      final detail = await _get<Map<String, dynamic>>(BookFakeApi.book, {
        'id': 'bk-atomic',
      });
      expect(detail!['hidden'], isTrue);
    },
  );

  test('an Author in use is not deleted; an unused one is', () async {
    final authors = CatalogAdminFakeApi.records(RecordKind.author);
    expect(await _post('$authors/delete', {'id': 'au-harari'}), isNull);
    final added =
        await _post('$authors/save', {'name': 'Humayun Ahmed'}) as Map;
    expect(added['id'], 'au-humayun-ahmed');
    expect(added['bookCount'], 0);
    expect(
      await _post('$authors/delete', {'id': 'au-humayun-ahmed'}),
      isNotNull,
    );
  });

  test("renaming an Author renames it on their Books", () async {
    final authors = CatalogAdminFakeApi.records(RecordKind.author);
    await _post('$authors/save', {'id': 'au-harari', 'name': 'Y. N. Harari'});
    final sapiens = await _get<Map<String, dynamic>>(BookFakeApi.book, {
      'id': 'bk-sapiens',
    });
    expect(sapiens!['author'], 'Y. N. Harari');
  });

  test('a Category used by Books keeps its Section', () async {
    final categories = CatalogAdminFakeApi.records(RecordKind.category);
    final moved = await _post('$categories/save', {
      'id': 'cat-fiction',
      'name': 'Fiction',
      'nameBn': 'ফিকশন',
      'section': 'children',
    });
    expect(moved, isNull);
  });

  test('Banners move and delete in display order', () async {
    expect(await _ids(HomeFakeApi.banners), [
      'ban-hadith',
      'ban-admission',
      'ban-sapiens-bn',
    ]);
    await _post(CatalogAdminFakeApi.moveBanner, {
      'id': 'ban-sapiens-bn',
      'by': -1,
    });
    expect(await _ids(HomeFakeApi.banners), [
      'ban-hadith',
      'ban-sapiens-bn',
      'ban-admission',
    ]);
    expect(
      await _post(CatalogAdminFakeApi.moveBanner, {
        'id': 'ban-hadith',
        'by': -1,
      }),
      isNull,
    );
    await _post(CatalogAdminFakeApi.deleteBanner, {'id': 'ban-hadith'});
    expect(await _ids(HomeFakeApi.banners), [
      'ban-sapiens-bn',
      'ban-admission',
    ]);
  });

  test('a new fake backend starts from the seed again', () async {
    await _post(CatalogAdminFakeApi.deleteBanner, {'id': 'ban-hadith'});
    await _post(CatalogAdminFakeApi.hideBook, {
      'id': 'bk-atomic',
      'hidden': true,
    });
    _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
    expect(await _ids(HomeFakeApi.banners), hasLength(3));
    expect(await _ids(BookFakeApi.books), contains('bk-atomic'));
  });
}

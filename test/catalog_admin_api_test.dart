import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_api.dart';

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
}

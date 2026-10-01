import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_api.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_record.dart';

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

void main() {
  setUp(() => _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor()));

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

  // The all-year Banners come first; the 4 Season Banners follow.
  Future<List<String>> allYear() async =>
      (await _ids(CatalogAdminFakeApi.banners)).take(3).toList();

  test('Banners move and delete in display order', () async {
    expect(await allYear(), ['ban-hadith', 'ban-admission', 'ban-sapiens-bn']);
    await _post(CatalogAdminFakeApi.moveBanner, {
      'id': 'ban-sapiens-bn',
      'by': -1,
    });
    expect(await allYear(), ['ban-hadith', 'ban-sapiens-bn', 'ban-admission']);
    expect(
      await _post(CatalogAdminFakeApi.moveBanner, {
        'id': 'ban-hadith',
        'by': -1,
      }),
      isNull,
    );
    await _post(CatalogAdminFakeApi.deleteBanner, {'id': 'ban-hadith'});
    expect((await allYear()).take(2), ['ban-sapiens-bn', 'ban-admission']);
  });

  test('a new fake backend starts from the seed again', () async {
    await _post(CatalogAdminFakeApi.deleteBanner, {'id': 'ban-hadith'});
    await _post(CatalogAdminFakeApi.hideBook, {
      'id': 'bk-atomic',
      'hidden': true,
    });
    _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
    expect(await _ids(CatalogAdminFakeApi.banners), hasLength(7));
    expect(await _ids(BookFakeApi.books), contains('bk-atomic'));
  });
}

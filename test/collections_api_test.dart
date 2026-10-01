import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';

final _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());

Future<List<dynamic>> _collections([String? section]) async =>
    (await _dio.get<List<dynamic>>(
      CollectionFakeApi.collections,
      queryParameters: {'section': ?section},
    )).data!;

Future<Map<String, dynamic>?> _detail(String id) async =>
    (await _dio.get<Map<String, dynamic>>(
      CollectionFakeApi.detail,
      queryParameters: {'id': id},
    )).data;

List<String> _bookIds(Map<String, dynamic> json) => [
  for (final b in json['books'] as List<dynamic>) (b as Map)['id'] as String,
];

void main() {
  test('/collections returns all 5', () async {
    expect(await _collections(), hasLength(5));
  });

  test('section=religious returns only the 3 Religious ones', () async {
    final religious = await _collections('religious');
    expect(religious, hasLength(3));
    expect(religious.every((c) => c['section'] == 'religious'), isTrue);
  });

  test('a Section with none returns an empty list', () async {
    expect(await _collections('literature'), isEmpty);
  });

  test('detail returns books in fixture order', () async {
    final seerah = await _detail('col-seerah-beginners');
    expect(_bookIds(seerah!), [
      'bk-nectar',
      'bk-lings-muhammad',
      'bk-moon-split',
    ]);
    final start = await _detail('col-start-here');
    expect(_bookIds(start!), [
      'bk-atomic',
      'bk-sapiens',
      'bk-zero',
      'bk-hobbit',
    ]);
  });

  test('an unknown id returns null', () async {
    expect(await _detail('col-nope'), isNull);
  });

  test('the 2 new Seerah books are found by Search', () async {
    for (final (q, id) in [
      ('earliest sources', 'bk-lings-muhammad'),
      ('moon split', 'bk-moon-split'),
    ]) {
      final found = await _dio.get<List<dynamic>>(
        BookFakeApi.books,
        queryParameters: {'q': q},
      );
      expect((found.data!.first as Map)['id'], id, reason: q);
    }
  });
}

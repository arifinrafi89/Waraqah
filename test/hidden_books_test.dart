import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';

final _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());

Future<List<String>> _bookIds([Map<String, dynamic> query = const {}]) async {
  final res = await _dio.get<List<dynamic>>(
    BookFakeApi.books,
    queryParameters: query,
  );
  return [for (final b in res.data!) (b as Map)['id'] as String];
}

void _hide(String id) {
  final i = BookFixtures.all.indexWhere((b) => b.id == id);
  BookFixtures.all[i] = BookFixtures.all[i].copyWith(hidden: true);
}

void main() {
  tearDown(BookFixtures.reset);

  test(
    'a hidden Book leaves /books and search, but not includeHidden',
    () async {
      _hide('bk-atomic');
      expect(await _bookIds(), isNot(contains('bk-atomic')));
      expect(await _bookIds({'q': 'atomic'}), isNot(contains('bk-atomic')));
      expect(await _bookIds({'includeHidden': true}), contains('bk-atomic'));
    },
  );

  test(
    '/books/detail still answers a hidden Book, null when unknown',
    () async {
      _hide('bk-atomic');
      final res = await _dio.get<Map<String, dynamic>>(
        BookFakeApi.book,
        queryParameters: {'id': 'bk-atomic'},
      );
      expect(res.data!['hidden'], isTrue);
      final none = await _dio.get<Map<String, dynamic>>(
        BookFakeApi.book,
        queryParameters: {'id': 'bk-nope'},
      );
      expect(none.data, isNull);
    },
  );

  test('a Collection leaves out its hidden Books', () async {
    _hide('bk-atomic');
    final res = await _dio.get<Map<String, dynamic>>(
      CollectionFakeApi.detail,
      queryParameters: {'id': 'col-start-here'},
    );
    final ids = [for (final b in res.data!['books']) (b as Map)['id']];
    expect(ids, ['bk-sapiens', 'bk-zero', 'bk-hobbit']);
  });

  test('reset restores the seed, Bangla titles included', () {
    _hide('bk-sapiens');
    BookFixtures.reset();
    final sapiens = BookFixtures.all.firstWhere((b) => b.id == 'bk-sapiens');
    expect(sapiens.hidden, isFalse);
    expect(sapiens.titleBn, 'স্যাপিয়েন্স');
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/scan/domain/entities/isbn.dart';

late Dio _dio;

Future<List<String>> _ids(String path, Map<String, dynamic> query) async {
  final res = await _dio.get<List<dynamic>>(path, queryParameters: query);
  return [for (final b in res.data!) (b as Map)['id'] as String];
}

void main() {
  setUp(() => _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor()));

  test('class=9 finds the SSC books, not the HSC ones', () async {
    final ids = await _ids(BookFakeApi.books, {'class': 9});
    expect(ids, containsAll(['bk-ssc-physics', 'bk-general-math']));
    expect(ids, isNot(contains('bk-hsc-physics-1')));
    // A typed URL sends the class as text.
    expect(await _ids(BookFakeApi.books, {'class': '9'}), ids);
  });

  test('exam=bcs finds only BCS books', () async {
    final ids = await _ids(BookFakeApi.books, {'exam': 'bcs'});
    expect(ids, unorderedEquals(['bk-bcs-guide', 'bk-bcs-gk']));
  });

  test('filters AND: Physics in School & College skips Admission', () async {
    final ids = await _ids(BookFakeApi.books, {
      'subject': 'sub-physics',
      'section': 'schoolCollege',
    });
    expect(ids, unorderedEquals(['bk-ssc-physics', 'bk-hsc-physics-1']));
    final both = await _ids(BookFakeApi.books, {
      'subject': 'sub-physics',
      'class': 11,
    });
    expect(both, ['bk-hsc-physics-1']);
  });

  test('/subjects lists only Subjects with Books in the Section', () async {
    Future<List<String>> subjects(String? section) async {
      final res = await _dio.get<List<dynamic>>(
        BookFakeApi.subjects,
        queryParameters: {'section': ?section},
      );
      return [for (final s in res.data!) (s as Map)['id'] as String];
    }

    expect(
      await subjects('academic'),
      unorderedEquals(['sub-math', 'sub-ict']),
    );
    expect(await subjects('literature'), isEmpty);
    expect(await subjects(null), hasLength(11));
  });

  test('every seed ISBN has a valid check digit', () {
    for (final e in BookFixtures.all.expand((b) => b.editions)) {
      if (e.isbn != null) expect(Isbn.normalize(e.isbn!), e.isbn, reason: e.id);
    }
  });
}

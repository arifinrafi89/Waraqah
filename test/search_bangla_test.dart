import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_suggest_fake_api.dart';

final _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());

Future<List<String>> _search(String q) async {
  final res = await _dio.get<List<dynamic>>(
    BookFakeApi.books,
    queryParameters: {'q': q},
  );
  return [for (final b in res.data!) (b as Map)['id'] as String];
}

Future<Object?> _get(String path, String q) async =>
    (await _dio.get<Object?>(path, queryParameters: {'q': q})).data;

void main() {
  test('Bangla, Banglish and English all find Sapiens first', () async {
    for (final q in ['স্যাপিয়েন্স', 'sapiyens', 'sapiens']) {
      expect((await _search(q)).first, 'bk-sapiens', reason: q);
    }
  });

  test('a Bangla Author name finds their Books', () async {
    expect(await _search('হারারি'), contains('bk-sapiens'));
  });

  test('a Bangla title typed as written still ranks first', () async {
    expect((await _search('অ্যাটমিক')).first, 'bk-atomic');
  });

  test('suggestions come in the script the reader typed', () async {
    final english = await _get(BookSuggestFakeApi.suggest, 'sap') as List;
    expect(english, contains('Sapiens: A Brief History of Humankind'));
    expect(english.length, lessThanOrEqualTo(5));
    final bangla = await _get(BookSuggestFakeApi.suggest, 'স্যাপি') as List;
    expect(bangla, contains('স্যাপিয়েন্স'));
  });

  test('did you mean picks a near title, or nothing', () async {
    expect(
      await _get(BookSuggestFakeApi.didYouMean, 'sapeinz'),
      'Sapiens: A Brief History of Humankind',
    );
    expect(await _get(BookSuggestFakeApi.didYouMean, 'qxqxqx'), isNull);
    expect(await _get(BookSuggestFakeApi.didYouMean, 'zzzz'), isNull);
  });
}

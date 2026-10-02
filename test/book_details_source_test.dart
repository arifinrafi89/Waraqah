import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_details_source.dart';

BookDetailsSource _source() =>
    BookDetailsSource(Dio()..interceptors.add(FakeApiRoutes.interceptor()));

void main() {
  test('reads a seeded book through the fake API', () async {
    final details = await _source().fetch('bk-atomic');

    expect(details!.bookId, 'bk-atomic');
    expect(details.description, isNotEmpty);
  });

  test('a book with nothing extra comes back as null', () async {
    expect(await _source().fetch('does-not-exist'), isNull);
  });

  test('errors are not swallowed', () async {
    final failing = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) =>
              handler.reject(DioException(requestOptions: options)),
        ),
      );

    expect(
      BookDetailsSource(failing).fetch('bk-atomic'),
      throwsA(isA<DioException>()),
    );
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/catalog/data/sources/book_details_source.dart';

void main() {
  test(
    'an unresponsive backend falls back to the seed within the budget',
    () async {
      final hangingDio = Dio()
        ..interceptors.add(
          // Never resolves or rejects, like a request to an unreachable host.
          InterceptorsWrapper(onRequest: (options, handler) {}),
        );
      final source = BookDetailsSource(
        hangingDio,
        budget: const Duration(milliseconds: 50),
      );

      final details = await source
          .fetch('bk-atomic')
          .timeout(const Duration(seconds: 1));

      expect(details?.offers.length, 4);
    },
  );

  test('a backend that fails fast also falls back to the seed', () async {
    final failingDio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) =>
              handler.reject(DioException(requestOptions: options)),
        ),
      );

    final details = await BookDetailsSource(failingDio).fetch('bk-fiqh');

    expect(details?.offers.first.vendor, 'Wafilife');
  });
}

import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/network/dio_client.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/core/usecase/usecase.dart';
import 'package:waraqah/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:waraqah/features/home/presentation/providers/home_providers.dart';

ProviderContainer _fakeApiContainer() {
  final dio = DioClient.create()..interceptors.add(FakeApiRoutes.interceptor());
  final container = ProviderContainer(
    overrides: [dioProvider.overrideWithValue(dio)],
  );
  return container;
}

void main() {
  group('FakeApiInterceptor (seam 1)', () {
    test('catalog search honours category and query', () {
      fakeAsync((async) {
        final container = _fakeApiContainer();
        addTearDown(container.dispose);

        List<Book>? byCategory;
        container
            .read(bookRepositoryProvider)
            .searchCatalog(category: 'Islamic Studies')
            .then((books) => byCategory = books);
        async.elapse(const Duration(seconds: 1));
        expect(byCategory, isNotEmpty);
        expect(byCategory!.every((b) => b.category == 'Islamic Studies'), isTrue);

        List<Book>? byQuery;
        container
            .read(bookRepositoryProvider)
            .searchCatalog(query: 'zzz-not-a-real-title')
            .then((books) => byQuery = books);
        async.elapse(const Duration(seconds: 1));
        expect(byQuery, isEmpty);
      });
    });

    test('ayahOfTheDayProvider loads today\'s Ayah', () {
      fakeAsync((async) {
        final container = _fakeApiContainer();
        addTearDown(container.dispose);

        Object? result;
        container.read(getAyahOfTheDayProvider).call(const NoParams()).then((ayah) {
          result = ayah;
        });
        async.elapse(const Duration(seconds: 1));

        expect(result, isNotNull);
      });
    });
  });
}

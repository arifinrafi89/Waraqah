import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_tools_remote_source.dart';
import 'package:waraqah/features/catalog_admin/data/sources/isbn_lookup_fixtures.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/isbn_lookup.dart';
import 'package:waraqah/features/scan/domain/entities/isbn.dart';

late CatalogToolsRemoteSource _tools;

void main() {
  tearDown(BookFixtures.reset);
  setUp(
    () => _tools = CatalogToolsRemoteSource(
      Dio()..interceptors.add(FakeApiRoutes.interceptor()),
    ),
  );

  group('ISBN lookup', () {
    test('an ISBN on an Edition is already in the catalog', () async {
      final found = await _tools.lookUpIsbn('9789840004041');
      expect((found! as IsbnInCatalog).bookId, 'bk-ssc-physics');
    });

    test('an outside Book comes with its details', () async {
      final found = await _tools.lookUpIsbn('9780374533557') as IsbnFound;
      expect(found.title, 'Thinking, Fast and Slow');
      expect(found.author, 'Daniel Kahneman');
      expect(found.listPriceBdt, 1250);
      final bangla = await _tools.lookUpIsbn('9789840005017') as IsbnFound;
      expect(bangla.titleBn, 'দেয়াল');
    });

    test('an unknown ISBN answers null', () async {
      expect(await _tools.lookUpIsbn('9780000000002'), isNull);
    });

    test('every outside ISBN is valid', () {
      for (final isbn in IsbnLookupFixtures.byIsbn.keys) {
        expect(Isbn.normalize(isbn), isbn);
      }
    });
  });

  group('Low stock', () {
    test('lists low printed Editions, lowest first', () async {
      final low = await _tools.lowStock();
      expect(low, isNotEmpty);
      expect(low.map((e) => e.editionId), contains('bk-alchemist-pb-en'));
      final stocks = [for (final e in low) e.stock];
      expect(stocks, [...stocks]..sort());
      expect(stocks.every((s) => s <= 5), isTrue);
      expect(low.any((e) => e.format == BookFormat.ebook), isFalse);
      final preorders = {
        for (final b in BookFixtures.all)
          for (final e in b.editions)
            if (e.isPreorder) e.id,
      };
      expect(low.any((e) => preorders.contains(e.editionId)), isFalse);
    });

    test('new stock above the limit takes the Edition off', () async {
      await _tools.setStock('bk-alchemist-pb-en', 20);
      final low = await _tools.lowStock();
      expect(
        low.map((e) => e.editionId),
        isNot(contains('bk-alchemist-pb-en')),
      );
    });

    test('an eBook or a negative stock is refused', () async {
      await expectLater(
        _tools.setStock('bk-sherlock-eb-en', 3),
        throwsStateError,
      );
      await expectLater(
        _tools.setStock('bk-alchemist-pb-en', -1),
        throwsStateError,
      );
    });
  });
}

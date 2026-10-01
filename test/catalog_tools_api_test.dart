import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_tools_remote_source.dart';
import 'package:waraqah/features/catalog_admin/data/sources/isbn_lookup_fixtures.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/isbn_lookup.dart';
import 'package:waraqah/features/scan/domain/entities/isbn.dart';

late CatalogToolsRemoteSource _tools;

void main() {
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
}

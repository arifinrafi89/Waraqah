import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/app_harness.dart';

Future<List<String>> _search(String q) async {
  final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
  final res = await dio.get<List<dynamic>>(
    BookFakeApi.books,
    queryParameters: {'q': q},
  );
  return [for (final b in res.data!) (b as Map)['id'] as String];
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('fake API /books?q=', () {
    test('matches Author name and Bangla name, ignoring case', () async {
      final byName = await _search('YUVAL');
      expect(byName, contains('bk-sapiens'));
      expect(await _search('হারারি'), byName);
    });

    test('matches Publisher name', () async {
      expect(await _search('bloomsbury'), isNotEmpty);
    });

    test('ranks title-starts, then title-contains, then the rest', () async {
      final titles = {
        for (final b in BookFixtures.all) b.id: b.title.toLowerCase(),
      };
      final ids = await _search('the');
      int rank(String id) => titles[id]!.startsWith('the')
          ? 0
          : titles[id]!.contains('the')
          ? 1
          : 2;
      expect(ids.map(rank).toSet(), containsAll([0, 1]));
      expect(ids.map(rank).toList(), [...ids.map(rank)]..sort());
      expect(await _search('zzz-not-a-real-title'), isEmpty);
    });
  });

  testWidgets('Catalog search bar opens the Search page with the hint', (
    tester,
  ) async {
    final router = await openApp(tester, CatalogRoutes.catalog);

    await tester.tap(find.byType(TextField));
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.search);
    expect(
      find.text('Search by title, author, publisher or ISBN'),
      findsOneWidget,
    );
    expect(find.text('Home'), findsWidgets);
  });

  testWidgets('typing shows live results and a count', (tester) async {
    await openApp(tester, CatalogRoutes.search);

    await tester.enterText(find.byType(TextField), 'MATILDA');
    await settle(tester);

    expect(find.text('1 results'), findsOneWidget);
    expect(find.text('Matilda'), findsWidgets);
    expect(
      find.text('Search by title, author, publisher or ISBN'),
      findsNothing,
    );
  });

  testWidgets('no match shows the message and Request this book', (
    tester,
  ) async {
    final router = await openApp(tester, CatalogRoutes.search);

    await tester.enterText(find.byType(TextField), 'zzzz');
    await settle(tester);
    expect(find.text("No books found for 'zzzz'"), findsOneWidget);

    await tester.tap(find.text('Request this book'));
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.requestBook);
    expect(find.text('Coming soon'), findsOneWidget);
  });
}

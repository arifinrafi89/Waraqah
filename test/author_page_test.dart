import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/app_harness.dart';

const _harari = 'au-harari';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('tapping the Author name on the book page opens the Author', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-sapiens'),
    );

    await tester.tap(find.text('Yuval Noah Harari'));
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.authorFor(_harari));
  });

  testWidgets('Author page shows name, bio and Books', (tester) async {
    await openApp(tester, CatalogRoutes.authorFor(_harari));

    expect(tester.takeException(), isNull);
    // App bar title, plus the book row's own author line.
    expect(find.text('Yuval Noah Harari'), findsNWidgets(2));
    expect(find.textContaining('Israeli historian'), findsOneWidget);
    expect(find.textContaining('Sapiens'), findsWidgets);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('Bangla locale shows the Bangla name', (tester) async {
    await openApp(tester, CatalogRoutes.authorFor(_harari), locale: 'bn');

    expect(find.text('ইউভাল নোয়া হারারি'), findsOneWidget);
  });

  testWidgets('unknown Author shows Not found, not retry', (tester) async {
    await openApp(tester, CatalogRoutes.authorFor('au-nope'));

    expect(tester.takeException(), isNull);
    expect(find.text('Not found'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  test('fake API: /books?author= filters; unknown Author is null', () async {
    final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());

    final books = await dio.get<List<dynamic>>(
      BookFakeApi.books,
      queryParameters: {'author': _harari},
    );
    final expected = BookFixtures.all.where((b) => b.authorId == _harari);
    expect(expected, isNotEmpty);
    expect(
      books.data!.map((b) => (b as Map)['id']).toSet(),
      expected.map((b) => b.id).toSet(),
    );

    final unknown = await dio.get<Map<String, dynamic>>(
      BookFakeApi.author,
      queryParameters: {'id': 'au-nope'},
    );
    expect(unknown.data, isNull);
  });
}

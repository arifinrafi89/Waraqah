import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Section page shows Category chips; a chip opens its page', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.sectionFor(Section.children),
    );

    expect(find.text('Picture Books'), findsOneWidget);
    expect(find.text('Story Books'), findsOneWidget);

    await tester.tap(find.text('Story Books'));
    await settle(tester);

    expect(pathOf(router), '/catalog/section/children/cat-kids-stories');
    expect(tester.takeException(), isNull);
    expect(find.text('1 books'), findsOneWidget);
    expect(find.text('Matilda'), findsWidgets);
    expect(find.text('The Very Hungry Caterpillar'), findsNothing);
  });

  testWidgets('Bangla locale shows Bangla Category names', (tester) async {
    await openApp(
      tester,
      CatalogRoutes.sectionFor(Section.children),
      locale: 'bn',
    );

    expect(find.text('ছবির বই'), findsOneWidget);
  });

  testWidgets('unknown Category shows Not found, not retry', (tester) async {
    await openApp(
      tester,
      CatalogRoutes.categoryFor(Section.children, 'cat-nope'),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Not found'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  test(
    'fake API: /categories and /books?category= filter and combine',
    () async {
      final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
      Future<List<dynamic>> get(String path, Map<String, dynamic> q) async =>
          (await dio.get<List<dynamic>>(path, queryParameters: q)).data!;

      final cats = await get(BookFakeApi.categories, {'section': 'children'});
      expect(cats.map((c) => (c as Map)['section']).toSet(), {'children'});
      expect(cats, hasLength(2));

      final books = await get(BookFakeApi.books, {
        'category': 'cat-kids-stories',
      });
      expect(books.map((b) => (b as Map)['title']), ['Matilda']);

      final both = await get(BookFakeApi.books, {
        'category': 'cat-kids-stories',
        'section': 'academic',
      });
      expect(both, isEmpty);
    },
  );
}

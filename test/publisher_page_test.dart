import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/app_harness.dart';

const _harper = 'pub-harper';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('tapping the Publisher on the book page opens the Publisher', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-sapiens'),
    );

    await tester.scrollUntilVisible(
      find.text('Harper'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    // Center the tag: at the top edge it sits under the header and misses.
    await Scrollable.ensureVisible(
      tester.element(find.text('Harper')),
      alignment: 0.5,
    );
    await tester.pump();
    await tester.tap(find.text('Harper'));
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.publisherFor(_harper));
  });

  testWidgets('Publisher page shows name and Books', (tester) async {
    await openApp(tester, CatalogRoutes.publisherFor(_harper));

    expect(tester.takeException(), isNull);
    expect(find.text('Harper'), findsOneWidget);
    expect(find.textContaining('Sapiens'), findsWidgets);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('unknown Publisher shows Not found, not retry', (tester) async {
    await openApp(tester, CatalogRoutes.publisherFor('pub-nope'));

    expect(tester.takeException(), isNull);
    expect(find.text('Not found'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  test(
    'fake API: /books?publisher= filters; unknown Publisher is null',
    () async {
      final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());

      final books = await dio.get<List<dynamic>>(
        BookFakeApi.books,
        queryParameters: {'publisher': _harper},
      );
      final expected = BookFixtures.all.where((b) => b.publisherId == _harper);
      expect(expected, isNotEmpty);
      expect(
        books.data!.map((b) => (b as Map)['id']).toSet(),
        expected.map((b) => b.id).toSet(),
      );

      final unknown = await dio.get<Map<String, dynamic>>(
        BookFakeApi.publisher,
        queryParameters: {'id': 'pub-nope'},
      );
      expect(unknown.data, isNull);
    },
  );
}

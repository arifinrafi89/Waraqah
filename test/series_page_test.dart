import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';

import 'helpers/app_harness.dart';

const _langdon = 'ser-robert-langdon';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('tapping the Series name on the book page opens the Series', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-davinci'),
    );

    await tester.scrollUntilVisible(
      find.text('Robert Langdon'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Robert Langdon'));
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.seriesFor(_langdon));
  });

  testWidgets('Series page lists entries in order; unsold ones do nothing', (
    tester,
  ) async {
    final router = await openApp(tester, CatalogRoutes.seriesFor(_langdon));

    expect(tester.takeException(), isNull);
    final titles = ['Angels & Demons', 'The Da Vinci Code', 'The Lost Symbol'];
    final tops = [
      for (final t in titles) tester.getTopLeft(find.text(t).last).dy,
    ];
    expect(tops, [...tops]..sort());
    expect(find.text('Not in store yet'), findsWidgets);

    await tester.tap(find.text('Angels & Demons').last);
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.seriesFor(_langdon));

    await tester.tap(find.text('The Da Vinci Code').last);
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.bookDetailFor('bk-davinci'));
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('unknown Series shows Not found, not retry', (tester) async {
    await openApp(tester, CatalogRoutes.seriesFor('ser-nope'));

    expect(tester.takeException(), isNull);
    expect(find.text('Not found'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  test('fake API: unknown /series/detail id is null', () async {
    final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
    final unknown = await dio.get<Map<String, dynamic>>(
      BookFakeApi.seriesDetail,
      queryParameters: {'id': 'ser-nope'},
    );
    expect(unknown.data, isNull);
  });
}

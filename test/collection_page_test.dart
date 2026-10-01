import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/presentation/widgets/collection_tile.dart';
import 'package:waraqah/features/home/home_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Collection page shows title, note and books in order', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.collectionFor('col-seerah-beginners'),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Seerah for beginners'), findsOneWidget);
    expect(find.textContaining('Start with The Sealed Nectar'), findsOneWidget);
    final titles = [
      'The Sealed Nectar',
      'Muhammad: His Life Based on the Earliest Sources',
      'When the Moon Split',
    ];
    final tops = [
      for (final t in titles) tester.getTopLeft(find.text(t).last).dy,
    ];
    expect(tops, [...tops]..sort());

    await tester.tap(find.text('When the Moon Split').last);
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.bookDetailFor('bk-moon-split'));
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('unknown Collection shows Not found, not retry', (tester) async {
    await openApp(tester, CatalogRoutes.collectionFor('col-nope'));

    expect(tester.takeException(), isNull);
    expect(find.text('Not found'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('Religious Section page shows Collections; Children not', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.sectionFor(Section.religious));
    expect(find.byType(CollectionTile), findsWidgets);
    expect(find.text('Hadith collections'), findsOneWidget);

    await openApp(tester, CatalogRoutes.sectionFor(Section.children));
    expect(find.byType(CollectionTile), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Home Collections strip opens the Collection page', (
    tester,
  ) async {
    final router = await openApp(tester, HomeRoutes.home);
    final home = find
        .descendant(
          of: find.byType(CustomScrollView),
          matching: find.byType(Scrollable),
        )
        .first;
    await tester.scrollUntilVisible(
      find.text('Start with these'),
      200,
      scrollable: home,
    );
    // scrollUntilVisible leaves the strip at the very top; bring it down.
    await tester.drag(home, const Offset(0, 300));
    await settle(tester);

    await tester.tap(find.text('Start with these'));
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.collectionFor('col-start-here'));
    expect(find.textContaining('getting back into books'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

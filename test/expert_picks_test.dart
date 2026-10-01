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

  testWidgets('Home shows Expert Picks after Collections; a tile opens it', (
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
      find.text('Stories that made me a writer'),
      200,
      scrollable: home,
    );
    // scrollUntilVisible leaves the strip at the very top; bring it down.
    await tester.drag(home, const Offset(0, 300));
    await settle(tester);
    expect(find.text('Expert Picks'), findsOneWidget);
    expect(find.textContaining('by Shirin Akhter'), findsOneWidget);
    // Only in the Expert Picks strip: the Collections strip leaves it out.
    expect(find.text('Stories that made me a writer'), findsOneWidget);

    await tester.tap(find.text('Stories that made me a writer'));
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.collectionFor('col-exp-stories'));

    await tester.tap(find.textContaining('Picked by Shirin Akhter'));
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.expertFor('exp-shirin-novelist'));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Expert page shows credential, kind and their picks', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.expertFor('exp-mahmudul-scholar'));

    expect(tester.takeException(), isNull);
    expect(find.text('Dr. Mahmudul Karim'), findsOneWidget);
    expect(find.text('Islamic studies scholar'), findsOneWidget);
    expect(find.text('Scholar'), findsOneWidget);
    expect(find.byIcon(Icons.verified_rounded), findsWidgets);
    expect(find.text('A first Islamic shelf'), findsOneWidget);
  });

  testWidgets('an unknown Expert shows Not found', (tester) async {
    await openApp(tester, CatalogRoutes.expertFor('exp-nope'), locale: 'bn');

    expect(tester.takeException(), isNull);
    expect(find.text('Retry'), findsNothing);
    expect(find.byType(CollectionTile), findsNothing);
  });

  testWidgets('Religious Section page: Collections, then Expert Picks', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.sectionFor(Section.religious));

    expect(tester.takeException(), isNull);
    final collections = tester.getTopLeft(find.text('Collections')).dy;
    final picks = tester.getTopLeft(find.text('Expert Picks')).dy;
    expect(picks, greaterThan(collections));
    expect(find.text('A first Islamic shelf'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/home/data/sources/season_fixtures.dart';
import 'package:waraqah/features/home/data/sources/season_picker.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/features/home/presentation/widgets/season_hero_card.dart';

import 'helpers/app_harness.dart';

Finder _hero(String text) =>
    find.descendant(of: find.byType(SeasonHeroCard), matching: find.text(text));

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets("Home shows today's Season hero; tapping opens its Collection", (
    tester,
  ) async {
    final router = await openApp(tester, HomeRoutes.home);
    final today = SeasonPicker.activeOn(DateTime.now());
    if (today == null) {
      expect(
        find.descendant(
          of: find.byType(SeasonHeroCard),
          matching: find.byType(Text),
        ),
        findsNothing,
      );
      return;
    }
    final info = SeasonFixtures.info[today]!;
    expect(_hero(info.titleEn), findsOneWidget);

    await tester.tap(_hero(info.titleEn));
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.collectionFor(info.collectionId));
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Staff force Ramadan on the Banners tab; Home follows', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      '/admin/catalog',
      role: 'catalogManager',
    );
    await tester.ensureVisible(find.text('Banners'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Banners'));
    await settle(tester);
    await settle(tester);

    await tester.tap(find.text('Automatic (by date)'));
    await settle(tester);
    await tester.tap(find.text('Ramadan').last);
    await settle(tester);

    router.go(HomeRoutes.home);
    await settle(tester);
    await settle(tester);
    expect(_hero('Ramadan reading'), findsOneWidget);
    expect(find.text('Ramadan Mubarak'), findsOneWidget);
  });
}

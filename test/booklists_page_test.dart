import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the Catalog card opens Booklists; a guest is asked to log in', (
    tester,
  ) async {
    final router = await openApp(tester, CatalogRoutes.catalog);
    await tester.scrollUntilVisible(
      find.text('Booklists'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Booklists'));
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.booklists);

    expect(find.text('Log in to make your own lists.'), findsOneWidget);
    expect(find.text('Summer reads'), findsNothing);
    expect(find.text('Class lists'), findsOneWidget);
    expect(find.text('Class 8 class list'), findsOneWidget);
    expect(find.text('HSC Physics prep'), findsOneWidget);

    await tester.tap(find.text('New list'));
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a Reader makes a list, adds a book and removes it', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.booklists, role: 'reader');
    expect(find.text('Summer reads'), findsOneWidget);

    await tester.tap(find.text('New list'));
    await settle(tester);
    await tester.enterText(find.byType(TextField), 'Eid gifts');
    await tester.tap(find.text('Save'));
    await settle(tester);
    expect(find.text('Eid gifts'), findsOneWidget);
    expect(find.text('No books in this list yet.'), findsOneWidget);

    await tester.tap(find.text('Add books'));
    await settle(tester);
    await tester.enterText(find.byType(TextField).last, 'matilda');
    await settle(tester);
    await tester.tap(find.widgetWithText(ListTile, 'Matilda'));
    await settle(tester);
    await tester.tap(find.text('Done'));
    await settle(tester);
    expect(find.text('Matilda'), findsWidgets);
    expect(find.byTooltip('Remove from list'), findsOneWidget);

    await tester.tap(find.byTooltip('Remove from list'));
    await settle(tester);
    expect(find.text('Matilda'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Booklists read in Bangla', (tester) async {
    await openApp(tester, CatalogRoutes.booklists, locale: 'bn');
    expect(find.text('অষ্টম শ্রেণির বইয়ের তালিকা'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

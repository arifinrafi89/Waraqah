import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/catalog_admin/catalog_admin_routes.dart';
import 'package:waraqah/features/home/home_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the builder adds a book to a new Collection; Home shows it', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      '/admin/catalog',
      role: 'catalogManager',
    );
    router.push(CatalogAdminRoutes.newCollection);
    await settle(tester);

    await tester.tap(find.text('Save'));
    await settle(tester);
    expect(find.text('Add at least one book'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Title (English)'),
      'Rainy days',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Title (Bangla)'),
      'বর্ষার দিন',
    );
    await tester.tap(find.text('Add books'));
    await settle(tester);
    await tester.enterText(find.byType(TextField).last, 'hobbit');
    await settle(tester);
    await tester.tap(find.widgetWithText(ListTile, 'The Hobbit'));
    await tester.pump();
    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    await tester.tap(find.text('Done'));
    await settle(tester);

    expect(find.widgetWithText(ListTile, 'The Hobbit'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await settle(tester);
    expect(find.text('Saved'), findsOneWidget);

    router.go(HomeRoutes.home);
    await settle(tester);
    await tester.scrollUntilVisible(
      find.text('Rainy days'),
      300,
      scrollable: find
          .descendant(
            of: find.byType(CustomScrollView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('the Collections tab switches to Staff Booklists', (
    tester,
  ) async {
    await openApp(tester, '/admin/catalog', role: 'catalogManager');
    await tester.ensureVisible(find.text('Collections'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Collections'));
    await settle(tester);
    expect(find.text('Seerah for beginners'), findsOneWidget);

    await tester.tap(find.text('Booklists'));
    await settle(tester);
    expect(find.text('Class 8 class list'), findsOneWidget);
    expect(find.text('Summer reads'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}

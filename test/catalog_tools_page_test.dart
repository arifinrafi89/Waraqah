import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/catalog_admin/catalog_admin_routes.dart';

import 'helpers/app_harness.dart';

Future<void> _tapText(WidgetTester tester, String text) async {
  await settle(tester); // A sheet may still be sliding in.
  await tester.ensureVisible(find.text(text).last);
  await tester.tap(find.text(text).last);
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('ISBN lookup on Add book', () {
    Future<void> lookUp(WidgetTester tester, String isbn) async {
      await openApp(tester, CatalogAdminRoutes.newBook, role: 'catalogManager');
      await tester.enterText(find.byType(TextFormField).first, isbn);
      await _tapText(tester, 'Look up');
    }

    testWidgets('fills the form, adding the new Author and Publisher', (
      tester,
    ) async {
      await lookUp(tester, '978-0-374-53355-7');
      // Daniel Kahneman, then his Publisher, open "Add new" filled in.
      expect(find.text('Daniel Kahneman'), findsWidgets);
      await _tapText(tester, 'Save');
      expect(find.text('Farrar, Straus and Giroux'), findsWidgets);
      await _tapText(tester, 'Save');
      expect(find.text('Thinking, Fast and Slow'), findsWidgets);
      expect(find.text('Daniel Kahneman'), findsOneWidget);
    });

    testWidgets('a catalog ISBN offers to open that Book', (tester) async {
      await lookUp(tester, '9789840004041');
      expect(find.text('Already in the catalog'), findsOneWidget);
      await _tapText(tester, 'Open');
      expect(find.text('Edit book'), findsOneWidget);
      expect(find.text('SSC Physics'), findsWidgets);
    });

    testWidgets('a bad check digit or unknown ISBN says so', (tester) async {
      await lookUp(tester, '9780374533558');
      expect(
        find.text('Not a valid ISBN. Check the 10 or 13 digits.'),
        findsOneWidget,
      );
      await tester.enterText(find.byType(TextFormField).first, '9780000000002');
      await _tapText(tester, 'Look up');
      expect(find.text('Not found — fill in by hand.'), findsOneWidget);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('in Bangla the book page leads with the Bangla title', (
    tester,
  ) async {
    await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-sapiens'),
      locale: 'bn',
    );
    expect(find.text('স্যাপিয়েন্স'), findsWidgets);
    // The catalogue title stays underneath.
    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);
  });

  testWidgets('in English the Bangla title is the second line', (tester) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-sapiens'));
    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);
    expect(find.text('স্যাপিয়েন্স'), findsOneWidget);
  });

  testWidgets('Bangla book cards and rows use Bangla titles', (tester) async {
    await openApp(
      tester,
      CatalogRoutes.searchFor(query: 'sapiens'),
      locale: 'bn',
    );
    expect(find.text('স্যাপিয়েন্স'), findsWidgets);
  });
}

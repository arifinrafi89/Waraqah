import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Catalog tab shows the Section grid; a tile opens its page', (
    tester,
  ) async {
    final router = await openApp(tester, CatalogRoutes.catalog);

    expect(tester.takeException(), isNull);
    expect(find.text('Academic'), findsOneWidget);
    expect(find.text('Admission & Job Prep'), findsOneWidget);

    await tester.tap(find.text('Children'));
    await settle(tester);

    expect(pathOf(router), '/catalog/section/children');
    expect(find.text('Children'), findsOneWidget);
    expect(find.text('2 books'), findsOneWidget);
    expect(find.text('Matilda'), findsWidgets);
    expect(find.text('The Very Hungry Caterpillar'), findsOneWidget);
    // Still inside the Catalog tab, so the bottom nav is still there.
    expect(find.text('Home'), findsWidgets);
  });

  testWidgets('an unknown Section goes back to the Catalog', (tester) async {
    final router = await openApp(tester, '/catalog/section/nope');
    expect(pathOf(router), CatalogRoutes.catalog);
  });

  test('seed: every Section has a Book, and 2+ Categories in use', () {
    for (final section in Section.values) {
      final inSection = BookFixtures.all.where((b) => b.section == section);
      expect(inSection, isNotEmpty, reason: section.name);
    }
    for (final section in [
      Section.admissionJobPrep,
      Section.schoolCollege,
      Section.skillsTech,
      Section.children,
    ]) {
      final categories = {
        for (final b in BookFixtures.all.where((b) => b.section == section))
          b.categoryId,
      };
      expect(categories.length, greaterThanOrEqualTo(2), reason: section.name);
    }
  });
}

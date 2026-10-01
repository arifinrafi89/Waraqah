import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/presentation/widgets/back_app_bar.dart';

import 'helpers/app_harness.dart';

Future<void> _tap(WidgetTester tester, String chip) async {
  await tester.ensureVisible(find.widgetWithText(FilterChip, chip));
  await tester.tap(find.widgetWithText(FilterChip, chip));
  await settle(tester);
}

/// The book count under the Section's name, not a Collection tile's.
Finder _count(String text) =>
    find.descendant(of: find.byType(BackAppBar), matching: find.text(text));

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('School & College: Class 9 narrows the list in place', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.sectionFor(Section.schoolCollege));
    expect(find.text('Class'), findsOneWidget);
    expect(find.text('Exam'), findsOneWidget);
    expect(find.text('Subject'), findsOneWidget);

    await _tap(tester, 'Class 9');
    // SSC Physics, Chemistry, Biology, General Math and English Grammar.
    expect(_count('5 books'), findsOneWidget);
    expect(find.text('HSC ICT'), findsNothing);

    await _tap(tester, 'Physics');
    expect(_count('1 books'), findsOneWidget);
    expect(find.text('SSC Physics'), findsWidgets);

    // Tapping the picked chip clears its row.
    await _tap(tester, 'Class 9');
    expect(_count('2 books'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('no match shows Clear filters, which brings the list back', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.sectionFor(Section.schoolCollege));
    await _tap(tester, 'Class 6');
    await _tap(tester, 'Physics');
    expect(find.text('No books for this choice yet.'), findsOneWidget);

    await tester.tap(find.text('Clear filters'));
    await settle(tester);
    expect(find.text('No books for this choice yet.'), findsNothing);
    expect(_count('11 books'), findsOneWidget);
  });

  testWidgets('Academic shows only Subject; Literature shows no rows', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.sectionFor(Section.academic));
    expect(find.text('Subject'), findsOneWidget);
    expect(find.text('Class'), findsNothing);
    expect(find.text('Exam'), findsNothing);

    await openApp(tester, CatalogRoutes.sectionFor(Section.literature));
    expect(find.text('Subject'), findsNothing);
    expect(find.byType(FilterChip), findsNothing);
  });

  testWidgets('Bangla locale shows Bangla rows and Subjects', (tester) async {
    await openApp(
      tester,
      CatalogRoutes.sectionFor(Section.admissionJobPrep),
      locale: 'bn',
    );
    expect(find.text('পরীক্ষা'), findsOneWidget);
    expect(find.text('বিসিএস'), findsOneWidget);
    expect(find.text('পদার্থবিজ্ঞান'), findsOneWidget);
    expect(find.text('শ্রেণি'), findsNothing);
  });
}

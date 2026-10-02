import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog_admin/catalog_admin_routes.dart';
import 'package:waraqah/features/catalog_admin/data/models/book_draft_json.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_store.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/book_draft.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_admin_rules.dart';

import 'helpers/app_harness.dart';

BookDraft _draft(String id) =>
    BookDraft.of(BookFixtures.all.firstWhere((b) => b.id == id));

Set<RuleError> _rules(BookDraft d) =>
    CatalogAdminRules.book(d, categorySection: d.section);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);
  tearDown(BookFixtures.reset);

  test('Class and Exam must be ones the Section offers', () {
    final ssc = _draft('bk-ssc-physics');
    expect(_rules(ssc), isEmpty);
    expect(_rules(ssc.copyWith(classes: [5])), {RuleError.classNotAllowed});
    expect(_rules(ssc.copyWith(exams: [Exam.bcs])), {RuleError.examNotAllowed});
    final admission = _draft('bk-admission-physics');
    expect(_rules(admission.copyWith(classes: [10])), {
      RuleError.classNotAllowed,
    });
  });

  test('the fake backend saves Class, Exam and Subject, refuses bad ones', () {
    final store = CatalogAdminFakeStore();
    final saved = store.saveBook(
      _draft('bk-ssc-physics').copyWith(classes: [10], subjectId: '').toJson(),
    );
    expect(saved!.classes, [10]);
    expect(saved.exams, [Exam.ssc]);
    expect(saved.subjectId, isNull);
    expect(
      store.saveBook(_draft('bk-bcs-gk').copyWith(classes: [9]).toJson()),
      isNull,
    );
  });

  testWidgets('the Book form shows Class rows, cleared by a new Section', (
    tester,
  ) async {
    await openApp(
      tester,
      CatalogAdminRoutes.bookFor('bk-ssc-physics'),
      role: 'catalogManager',
    );
    final class9 = find.widgetWithText(FilterChip, 'Class 9');
    expect(tester.widget<FilterChip>(class9).selected, isTrue);
    expect(find.text('Physics'), findsOneWidget);

    await tester.tap(find.text('School & College').last);
    await settle(tester);
    await tester.tap(find.text('Literature').last);
    await settle(tester);
    expect(find.byType(FilterChip), findsNothing);
    expect(find.text('Physics'), findsNothing);
  });
}

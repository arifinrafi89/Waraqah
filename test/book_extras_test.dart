import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

Future<void> _scrollTo(WidgetTester tester, Finder finder) => tester
    .scrollUntilVisible(finder, 250, scrollable: find.byType(Scrollable).first);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Look inside shows the contents and the first pages', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-sherlock'),
    );

    await tester.tap(find.text('Look inside'));
    await settle(tester);
    expect(pathOf(router), CatalogRoutes.lookInsideFor('bk-sherlock'));
    expect(tester.takeException(), isNull);
    expect(find.text('Part II: The Country of the Saints'), findsOneWidget);
    // Chapter 2 of Part I.
    expect(find.text('The Science of Deduction'), findsOneWidget);
    expect(find.text('2'), findsWidgets);

    await tester.tap(find.text('Sample pages'));
    await settle(tester);
    expect(find.textContaining('In the year 1878'), findsOneWidget);
    // The test font is wide, so scroll the page down to its footer.
    await tester.dragUntilVisible(
      find.text('Page 1 of 2 · swipe for more'),
      find.byType(PageView).last,
      const Offset(0, -300),
    );
    expect(find.text('Page 1 of 2 · swipe for more'), findsOneWidget);
  });

  testWidgets('books without contents have no Look inside button', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-atomic'));
    expect(find.text('Look inside'), findsNothing);
  });

  testWidgets('the series lists every book, in order', (tester) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-davinci'));
    await _scrollTo(tester, find.text('Robert Langdon'));

    expect(find.text('Book 2 of 5'), findsOneWidget);
    expect(find.text('Not in store yet'), findsNWidgets(4));

    await tester.ensureVisible(find.text('Angels & Demons').last);
    await settle(tester);
    await tester.tap(find.text('Angels & Demons').last);
    await tester.pump();
    expect(find.text("Waraqah doesn't sell this one yet."), findsOneWidget);
  });
}

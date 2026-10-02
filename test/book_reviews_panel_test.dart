import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/widgets/section_header.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

final _sapiens = CatalogRoutes.bookDetailFor('bk-sapiens');

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<void> tapVisible(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(
      finder,
      400,
      scrollable: find
          .descendant(
            of: find.byType(ListView).first,
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await Scrollable.ensureVisible(tester.element(finder), alignment: 0.5);
    await tester.pump();
    await tester.tap(finder);
    await settle(tester);
  }

  testWidgets('write a review: it shows with stars and the badge', (
    tester,
  ) async {
    await openApp(tester, _sapiens, role: 'reader');
    await tapVisible(tester, find.text('Write a review'));
    await tester.tap(find.byTooltip('4 of 5 stars'));
    await tester.enterText(find.byType(TextField), 'Worth every page');
    await tester.pump();
    await tester.tap(find.text('Save review'));
    await settle(tester);

    expect(find.text('Review saved.'), findsOneWidget);
    expect(find.text('Worth every page'), findsOneWidget);
    expect(find.text('Verified Purchase'), findsWidgets);
    expect(find.text('Edit your review'), findsOneWidget);
  });

  testWidgets('"See all" opens every review', (tester) async {
    final router = await openApp(tester, _sapiens);
    await tapVisible(
      tester,
      find.descendant(
        of: find.widgetWithText(SectionHeader, 'Reviews'),
        matching: find.text('See all'),
      ),
    );
    expect(pathOf(router), '/reviews');
    expect(find.textContaining('shared stories'), findsOneWidget);
  });

  testWidgets('the Bites panel opens the composer pre-tagged', (tester) async {
    final router = await openApp(tester, _sapiens, role: 'reader');
    await tapVisible(tester, find.text('Post a Bite about this book'));
    expect(pathOf(router), '/bites/compose');
    expect(find.byType(InputChip), findsOneWidget);
    expect(find.textContaining('Sapiens'), findsWidgets);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

const _sapiens = 'Sapiens: A Brief History of Humankind';

/// Types [text], then waits for results and the follow-up call they trigger
/// (suggestions, "Did you mean").
Future<void> _type(WidgetTester tester, String text) async {
  await tester.enterText(find.byType(TextField), text);
  await settle(tester);
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a Banglish spelling finds Sapiens, with its Bangla title', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.search);
    await _type(tester, 'sapiyens');

    expect(find.text('1 results'), findsOneWidget);
    expect(find.text(_sapiens), findsWidgets);
    expect(find.text('স্যাপিয়েন্স'), findsOneWidget);
  });

  testWidgets('a suggestion chip runs that search and saves it', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.search);
    await _type(tester, 'atom');

    final chip = find.widgetWithText(ActionChip, 'Atomic Habits');
    await tester.tap(chip);
    await settle(tester);
    await settle(tester);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      'Atomic Habits',
    );
    // The only suggestion is now what's typed, so the row hides.
    expect(chip, findsNothing);

    await _type(tester, '');
    expect(find.text('Atomic Habits'), findsOneWidget);
  });

  testWidgets('nonsense shows no "Did you mean"', (tester) async {
    await openApp(tester, CatalogRoutes.search);
    await _type(tester, 'zzzz');

    expect(find.text("No books found for 'zzzz'"), findsOneWidget);
    expect(find.textContaining('Did you mean'), findsNothing);
  });

  testWidgets('a near miss offers "Did you mean" and runs it', (tester) async {
    await openApp(tester, CatalogRoutes.search);
    await _type(tester, 'sapeinz');

    await tester.tap(find.text('Did you mean $_sapiens?'));
    await settle(tester);
    expect(find.text('1 results'), findsOneWidget);
    expect(find.text('Request this book'), findsNothing);
  });
}

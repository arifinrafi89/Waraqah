import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_harness.dart';

/// Taps [finder] once it's scrolled into view.
Future<void> _tap(WidgetTester tester, Finder finder) async {
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(
      finder,
      200,
      scrollable: find.byType(Scrollable).first,
    );
  }
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await settle(tester);
}

/// Picks [name] from the Author or Publisher sheet behind [label].
Future<void> _pick(WidgetTester tester, String label, String name) async {
  await _tap(
    tester,
    find.ancestor(of: find.text(label), matching: find.byType(InkWell)).first,
  );
  await tester.enterText(find.byType(TextField).last, name);
  await tester.pump();
  await _tap(tester, find.text(name).last);
}

/// Opens the dropdown showing [current] and picks [choice].
Future<void> _choose(WidgetTester tester, String current, String choice) async {
  await _tap(tester, find.text(current).last);
  await _tap(tester, find.text(choice).last);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a catalog manager sees all five tabs', (tester) async {
    await openApp(tester, '/admin/catalog', role: 'catalogManager');
    for (final tab in [
      'Books',
      'Categories',
      'Authors',
      'Publishers',
      'Banners',
    ]) {
      expect(find.text(tab), findsWidgets, reason: tab);
    }
    await tester.enterText(find.byType(TextField).first, 'atomic');
    await tester.pump();
    expect(find.text('Atomic Habits'), findsWidgets);
    expect(find.text('Matilda'), findsNothing);
  });

  testWidgets('a reader is bounced from /admin/catalog', (tester) async {
    final router = await openApp(tester, '/admin/catalog', role: 'reader');
    expect(pathOf(router), '/home');
  });

  testWidgets('a Book added through the form shows in the list', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      '/admin/catalog',
      role: 'catalogManager',
    );
    await tester.tap(find.text('Add book'));
    await settle(tester);
    expect(pathOf(router), '/admin/catalog/book');

    await _tap(tester, find.text('Save'));
    expect(find.text('Add a title'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Title'),
      'Shonar Tori',
    );
    await _pick(tester, 'Author', 'Yuval Noah Harari');
    await _pick(tester, 'Publisher', 'Harper');
    await _choose(tester, 'Academic', 'Literature');
    await _tap(tester, find.text('Category'));
    await _tap(tester, find.text('Fiction').last);

    await tester.scrollUntilVisible(
      find.text('Add at least one edition'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await _tap(tester, find.text('Add edition'));
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Price (৳)'),
      '300',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'Stock'), '5');
    await _tap(tester, find.text('Done'));
    expect(find.text('Paperback · Bangla'), findsOneWidget);

    await _tap(tester, find.text('Save'));
    expect(pathOf(router), '/admin/catalog');
    expect(find.text('Shonar Tori'), findsWidgets);
    expect(find.text('Yuval Noah Harari'), findsWidgets);
  });
}

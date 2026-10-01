import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_harness.dart';

Future<void> _openTab(WidgetTester tester, String tab) async {
  await openApp(tester, '/admin/catalog', role: 'catalogManager');
  await tester.tap(find.text(tab));
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('an Author added on the Authors tab shows with no books', (
    tester,
  ) async {
    await _openTab(tester, 'Authors');
    await tester.tap(find.text('Add'));
    await settle(tester);
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Name (English)'),
      'Humayun Ahmed',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Name (Bangla, optional)'),
      'হুমায়ূন আহমেদ',
    );
    await tester.tap(find.text('Save'));
    await settle(tester);

    final tile = find.widgetWithText(ListTile, 'Humayun Ahmed');
    await tester.scrollUntilVisible(
      tile,
      300,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.ensureVisible(tile);
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: tile,
        matching: find.text('হুমায়ূন আহমেদ · No books'),
      ),
      findsOneWidget,
    );
    await tester.tap(
      find.descendant(of: tile, matching: find.byTooltip('Delete')),
    );
    await settle(tester);
    expect(find.text('Humayun Ahmed'), findsNothing);
  });

  testWidgets("an Author with Books can't be deleted", (tester) async {
    await _openTab(tester, 'Authors');
    final tolkien = find.widgetWithText(ListTile, 'J. R. R. Tolkien');
    final delete = tester.widget<IconButton>(
      find.descendant(of: tolkien, matching: find.byType(IconButton)),
    );
    expect(delete.onPressed, isNull);
    expect(delete.tooltip, startsWith('Used by'));
  });

  testWidgets('Categories are grouped under their Section', (tester) async {
    await _openTab(tester, 'Categories');
    expect(find.text('Religious'), findsOneWidget);
    expect(find.text('Islamic Studies'), findsOneWidget);
    await tester.tap(find.text('Add'));
    await settle(tester);
    await tester.tap(find.text('Save'));
    await settle(tester);
    expect(find.text('Add a name'), findsOneWidget);
    expect(find.text('Add the Bangla name'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/profile/presentation/widgets/address_tile.dart';

import 'helpers/address_form.dart';
import 'helpers/app_harness.dart';

Future<void> _openMenu(WidgetTester tester, int index) async {
  await tester.tap(find.byType(PopupMenuButton<AddressAction>).at(index));
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('add an address through the pickers', (tester) async {
    await openApp(tester, '/profile', role: 'reader');
    await tester.tap(find.text('Saved addresses'));
    await settle(tester);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Default'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();
    await saveAddress(tester);
    expect(find.text('Give this address a name, like Home.'), findsOneWidget);

    await fillOfficeAddress(tester);
    await saveAddress(tester);
    expect(find.text('Office'), findsOneWidget);
    expect(find.textContaining('Kaliakair, Gazipur'), findsOneWidget);
  });

  testWidgets('make default, edit and delete with a confirm', (tester) async {
    await openApp(tester, '/profile/addresses', role: 'reader');

    await _openMenu(tester, 1);
    await tester.tap(find.text('Make default'));
    await settle(tester);
    // The new default moves to the top.
    expect(
      tester.getTopLeft(find.text('Family home')).dy,
      lessThan(tester.getTopLeft(find.text('Home')).dy),
    );

    await _openMenu(tester, 0);
    await tester.tap(find.text('Edit address'));
    await tester.pumpAndSettle();
    expect(find.text('Save address'), findsOneWidget);
    expect(find.text('Sylhet Sadar'), findsOneWidget);

    await _openMenu(tester, 1);
    await tester.tap(find.text('Delete address'));
    await tester.pumpAndSettle();
    expect(find.text('Remove this saved address?'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Delete address'));
    await settle(tester);
    expect(find.text('Home'), findsNothing);
  });
}

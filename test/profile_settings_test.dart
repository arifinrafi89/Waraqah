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

  testWidgets('settings save on the server and survive a reopen', (
    tester,
  ) async {
    final router = await openApp(tester, '/profile', role: 'reader');
    await tester.tap(find.text('Settings'));
    await settle(tester);
    expect(find.text('Moderation warnings always arrive.'), findsOneWidget);
    expect(find.text('Push notifications'), findsNothing);

    SwitchListTile tile(String title) =>
        tester.widget(find.widgetWithText(SwitchListTile, title));
    expect(tile('Price and stock alerts').value, isTrue);
    await tester.tap(find.text('Price and stock alerts'));
    await tester.tap(find.text('Profile visibility'));
    await settle(tester);

    router.pop();
    await settle(tester);
    await tester.tap(find.text('Settings'));
    await settle(tester);
    expect(tile('Price and stock alerts').value, isFalse);
    expect(tile('Profile visibility').value, isFalse);
    expect(tile('Orders and returns').value, isTrue);
  });

  testWidgets('delete account confirms, then signs out', (tester) async {
    final router = await openApp(tester, '/profile/settings', role: 'reader');
    await tester.ensureVisible(find.text('Delete account'));
    await tester.pump();
    await tester.tap(find.text('Delete account'));
    await tester.pumpAndSettle();
    expect(
      find.text('This will permanently remove your account and saved data.'),
      findsOneWidget,
    );
    await tester.tap(find.text('Delete permanently'));
    await settle(tester);
    expect(pathOf(router), '/login');
    expect(find.text('Your account was deleted.'), findsOneWidget);
  });
}

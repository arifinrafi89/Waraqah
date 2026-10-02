import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Edit profile saves the name; the header shows it', (
    tester,
  ) async {
    final router = await openApp(tester, '/profile', role: 'reader');
    await tester.tap(find.text('Edit profile'));
    await settle(tester);
    expect(router.state.uri.path, '/profile/edit');

    final name = find.byType(TextField).first;
    expect(find.text('Test'), findsWidgets);
    await tester.enterText(name, 'N');
    await tester.tap(find.text('Save changes'));
    await settle(tester);
    expect(find.text('Your name must be 2–60 characters.'), findsOneWidget);

    await tester.enterText(name, 'Nadia Rahman');
    await tester.enterText(find.byType(TextField).last, '+8801712345678');
    await tester.tap(find.text('Save changes'));
    await settle(tester);
    expect(pathOf(router), '/profile');
    expect(find.text('Nadia Rahman'), findsOneWidget);

    await tester.tap(find.text('Edit profile'));
    await settle(tester);
    expect(find.text('01712345678'), findsOneWidget);
  });

  testWidgets('Guests are bounced from /profile/edit', (tester) async {
    final router = await openApp(tester, '/profile/edit');
    expect(pathOf(router), '/login');
  });

  testWidgets('Guests see no account tiles on Profile', (tester) async {
    await openApp(tester, '/profile');
    expect(find.text('Edit profile'), findsNothing);
    expect(find.text('Saved addresses'), findsNothing);
    expect(find.text('Log In'), findsOneWidget);
  });
}

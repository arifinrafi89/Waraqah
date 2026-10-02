import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the For You feed renders Bites', (tester) async {
    await openApp(tester, '/bites', role: 'reader');
    expect(find.text('For You'), findsOneWidget);
    expect(find.textContaining('wheat chapter'), findsOneWidget);
    expect(find.text('Tanvir'), findsWidgets);
  });

  testWidgets('post a tagged Bite: it is first in For You', (tester) async {
    final router = await openApp(tester, '/bites', role: 'reader');
    await tester.tap(find.byTooltip('Write a Bite'));
    await settle(tester);
    expect(pathOf(router), '/bites/compose');

    await tester.enterText(find.byType(TextField).first, 'Loved the start');
    await tester.enterText(find.byType(TextField).last, 'Sapiens');
    await settle(tester);
    await tester.tap(find.textContaining('Sapiens: A Brief').last);
    await tester.pump();
    expect(find.byType(InputChip), findsOneWidget);

    await tester.tap(find.text('Post'));
    await settle(tester);
    expect(pathOf(router), '/bites');
    final first = find.byType(Card).first;
    expect(
      find.descendant(of: first, matching: find.text('Loved the start')),
      findsOneWidget,
    );
  });

  testWidgets('a spoiler is blurred until tapped', (tester) async {
    await openApp(tester, '/bites', role: 'reader');
    final label = find.textContaining('Spoiler about');
    await tester.scrollUntilVisible(
      label,
      300,
      scrollable: find
          .descendant(
            of: find.byType(ListView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(find.byType(ImageFiltered), findsOneWidget);
    await tester.tap(label);
    await tester.pump();
    expect(find.byType(ImageFiltered), findsNothing);
    expect(find.textContaining('cryptex'), findsOneWidget);
  });

  testWidgets('a guest taps the FAB and goes to login', (tester) async {
    final router = await openApp(tester, '/bites');
    await tester.tap(find.byTooltip('Write a Bite'));
    await settle(tester);
    expect(pathOf(router), '/login');
  });

  testWidgets('a guest sees a log-in prompt on Following', (tester) async {
    await openApp(tester, '/bites');
    await tester.tap(find.text('Following'));
    await settle(tester);
    expect(
      find.text('Log in to see Bites from readers you follow.'),
      findsOneWidget,
    );
  });
}

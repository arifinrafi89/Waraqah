import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<void> send(WidgetTester tester, String text) async {
    await tester.enterText(find.byType(TextField), text);
    await tester.pump();
    await tester.tap(find.byTooltip('Send'));
    await settle(tester);
  }

  testWidgets('comment, reply and delete your own', (tester) async {
    await openApp(tester, '/bites/detail?id=bt-1', role: 'reader');
    expect(find.textContaining('gossip holding groups'), findsOneWidget);
    expect(find.text('Same! I keep quoting it.'), findsOneWidget);

    await send(tester, 'Great pick');
    expect(find.text('Great pick'), findsOneWidget);

    await tester.tap(find.text('Reply').first);
    await tester.pump();
    expect(find.text('Replying to Nabila'), findsOneWidget);
    await send(tester, 'Agreed, Nabila');
    expect(find.text('Agreed, Nabila'), findsOneWidget);
    expect(find.text('Replying to Nabila'), findsNothing);

    await tester.tap(find.byTooltip('Delete comment').first);
    await settle(tester);
    expect(find.text('Comment deleted.'), findsOneWidget);
    expect(find.text('Agreed, Nabila'), findsNothing);
  });

  testWidgets('a guest sees "Log in to comment"', (tester) async {
    await openApp(tester, '/bites/detail?id=bt-1');
    expect(find.text('Log in to comment'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('the feed card opens the comments', (tester) async {
    final router = await openApp(tester, '/bites', role: 'reader');
    await tester.tap(find.byIcon(Icons.chat_bubble_outline_rounded).first);
    await settle(tester);
    expect(pathOf(router), '/bites/detail');
  });
}

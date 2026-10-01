import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/inbox/inbox_routes.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';

import 'helpers/app_harness.dart';

Future<void> _open(WidgetTester tester, String text) async {
  await tester.tap(find.text(text));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('an offer lands in the thread, and the reply arrives live', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      P2pRoutes.listingDetailFor('p2p-1'),
      role: 'reader',
    );
    await _open(tester, 'Make an offer');
    expect(find.text('To Tanvir · asking ৳320'), findsOneWidget);
    await tester.enterText(find.byType(TextField), '900');
    await tester.pump();
    expect(find.text('Offer ৳320 or less.'), findsOneWidget);
    await tester.enterText(find.byType(TextField), '280');
    await tester.pump();
    await tester.tap(find.text('Courier'));
    await tester.pump();
    await tester.tap(find.text('Send offer'));
    await settle(tester);
    await settle(tester);

    expect(pathOf(router), startsWith(InboxRoutes.inbox));
    expect(find.text('Offer · ৳280'), findsOneWidget);
    expect(find.textContaining('Courier'), findsOneWidget);
    expect(find.text('Waiting for Tanvir'), findsOneWidget);
    expect(find.text('Make an offer'), findsNothing, reason: 'one at a time');

    await tester.pump(const Duration(seconds: 5));
    await settle(tester);
    expect(
      find.text(
        "Thanks for the offer! Let me think about it, I'll reply soon.",
      ),
      findsOneWidget,
    );
  });

  testWidgets('Message opens the conversation and sends', (tester) async {
    await openApp(tester, P2pRoutes.listingDetailFor('p2p-3'), role: 'reader');
    await tester.tap(find.text('Message'));
    await settle(tester);
    await tester.enterText(find.byType(TextField), 'Is it still available?');
    await tester.tap(find.byTooltip('Send'));
    await settle(tester);
    expect(find.text('Is it still available?'), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
    await settle(tester);
    expect(
      find.text("Hi! Yes, it's still available. Ask me anything."),
      findsOneWidget,
    );
  });

  testWidgets('a fixed price is offered as it is', (tester) async {
    await openApp(tester, P2pRoutes.listingDetailFor('p2p-6'), role: 'reader');
    await _open(tester, 'Make an offer');
    expect(find.text("Mahi's price of ৳260 isn't negotiable."), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('guests log in before making an offer', (tester) async {
    final router = await openApp(tester, P2pRoutes.listingDetailFor('p2p-1'));
    await tester.tap(find.text('Make an offer'));
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('a book reserved for me says so and opens the chat', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      P2pRoutes.listingDetailFor('p2p-4'),
      role: 'reader',
    );
    expect(find.text('Reserved for you'), findsOneWidget);
    await tester.tap(find.text('Open chat'));
    await settle(tester);
    await settle(tester);
    expect(pathOf(router), InboxRoutes.threadFor('th-nabila'));
    expect(
      find.text('Saturday at 5 pm near Banani Road 11 works for me.'),
      findsOneWidget,
    );
  });
}

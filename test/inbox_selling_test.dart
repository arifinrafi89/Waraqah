import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/inbox/inbox_routes.dart';
import 'package:waraqah/features/inbox/presentation/widgets/inbox_button.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';

import 'helpers/app_harness.dart';

Finder _badge(String count) =>
    find.descendant(of: find.byType(InboxButton), matching: find.text(count));

/// Long enough for the demo buyer's one reply, and the live refresh after.
Future<void> _waitForReply(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 5));
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the inbox badge counts new offers and messages', (tester) async {
    await openApp(tester, P2pRoutes.p2p, role: 'reader');
    expect(tester.takeException(), isNull);
    expect(_badge('3'), findsOneWidget);
  });

  testWidgets('guests have no badge and log in to open the inbox', (
    tester,
  ) async {
    final router = await openApp(tester, P2pRoutes.p2p);
    expect(_badge('3'), findsNothing);
    await tester.tap(find.byType(InboxButton));
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('my listing lists the conversations about it', (tester) async {
    await openApp(tester, P2pRoutes.listingDetailFor('p2p-7'), role: 'reader');
    expect(find.text('Your listing'), findsOneWidget);
    expect(find.text('Make an offer'), findsNothing);
    await tester.scrollUntilVisible(find.text('Rafi · Selling'), 200);
    expect(find.text('Sadia · Selling'), findsOneWidget);
  });

  testWidgets('accepting reserves the book; the seller then marks it sold', (
    tester,
  ) async {
    final router = await openApp(tester, InboxRoutes.inbox, role: 'reader');
    expect(find.text('3 new'), findsOneWidget);
    await tester.tap(find.text('Sadia · Selling'));
    await settle(tester);
    await settle(tester);
    expect(find.text('Offer · ৳300'), findsOneWidget);

    await tester.tap(find.text('Accept'));
    await settle(tester);
    expect(find.text('Reserved for Sadia'), findsOneWidget);
    expect(
      find.text(
        "You accepted Sadia's offer of ৳300. The book is reserved for Sadia.",
      ),
      findsOneWidget,
    );

    // Sadia answers while the thread is open; it just appears.
    await _waitForReply(tester);
    expect(
      find.text('Great, thank you! When and where suits you?'),
      findsOneWidget,
    );

    await tester.tap(find.text('Mark as sold'));
    await tester.pump();
    await tester.tap(find.widgetWithText(FilledButton, 'Mark as sold').last);
    await settle(tester);
    expect(find.text('Sold to Sadia'), findsOneWidget);
    expect(find.text('How was the deal with Sadia?'), findsOneWidget);
    // Sadia rates back a moment later, live.
    await _waitForReply(tester);
    expect(find.text('Sadia rated you'), findsOneWidget);

    router.push(P2pRoutes.myListings);
    await settle(tester);
    expect(find.text('Sold'), findsWidgets);
  });

  testWidgets('declining tells the buyer and keeps the book on sale', (
    tester,
  ) async {
    await openApp(tester, InboxRoutes.threadFor('th-sadia'), role: 'reader');
    await settle(tester);
    await tester.tap(find.text('Decline'));
    await settle(tester);
    expect(find.text("You declined Sadia's offer of ৳300."), findsOneWidget);
    expect(find.text('Available'), findsOneWidget);
    await _waitForReply(tester);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/inbox/inbox_routes.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/report/report_routes.dart';

import 'helpers/app_harness.dart';

Future<void> _openMenu(WidgetTester tester) async {
  await tester.tap(find.byTooltip('More options'));
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a reader reports a listing with a reason', (tester) async {
    await openApp(tester, P2pRoutes.listingDetailFor('p2p-1'), role: 'reader');
    await _openMenu(tester);
    await tester.tap(find.text('Report this listing'));
    await tester.pumpAndSettle();
    expect(find.text('Why are you reporting it?'), findsOneWidget);

    await tester.tap(find.text('Photocopy or pirated book'));
    await tester.pump();
    await tester.tap(find.text('Send report'));
    await settle(tester);
    expect(tester.takeException(), isNull);
    expect(
      find.text('Thanks. A moderator will review your report.'),
      findsOneWidget,
    );
  });

  testWidgets('blocking a seller hides them until unblocked', (tester) async {
    final router = await openApp(
      tester,
      P2pRoutes.listingDetailFor('p2p-1'),
      role: 'reader',
    );
    await _openMenu(tester);
    await tester.tap(find.text('Block Tanvir'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Block'));
    await settle(tester);
    expect(
      find.text('You blocked Tanvir. Unblock them to make an offer.'),
      findsOneWidget,
    );

    router.go(ReportRoutes.blocked);
    await settle(tester);
    expect(find.text('Tanvir'), findsOneWidget);
    await tester.tap(find.text('Unblock'));
    await settle(tester);
    expect(find.text("You haven't blocked anyone."), findsOneWidget);
  });

  testWidgets("long-pressing someone's message reports it", (tester) async {
    await openApp(tester, InboxRoutes.threadFor('th-sadia'), role: 'reader');
    await tester.longPress(find.textContaining('Is Atomic Habits still'));
    await tester.pumpAndSettle();
    expect(find.text('Report this message'), findsOneWidget);
    // Messages can't be photocopies.
    expect(find.text('Photocopy or pirated book'), findsNothing);

    await tester.tap(find.text('Harassment or hate'));
    await tester.pump();
    await tester.tap(find.text('Send report'));
    await settle(tester);
    expect(
      find.text('Thanks. A moderator will review your report.'),
      findsOneWidget,
    );
  });

  testWidgets('a thread offers to report or block the other reader', (
    tester,
  ) async {
    await openApp(tester, InboxRoutes.threadFor('th-sadia'), role: 'reader');
    await _openMenu(tester);
    expect(find.text('Report this reader'), findsOneWidget);
    expect(find.text('Block Sadia'), findsOneWidget);
  });

  testWidgets('guests log in before reporting', (tester) async {
    final router = await openApp(tester, P2pRoutes.listingDetailFor('p2p-1'));
    await _openMenu(tester);
    await tester.tap(find.text('Report this listing'));
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('the rules show before listing a book', (tester) async {
    await openApp(tester, P2pRoutes.addListing, role: 'reader');
    expect(find.text('Before you list'), findsOneWidget);
    expect(
      find.text('Only original printed books. No photocopies.'),
      findsOneWidget,
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';

import 'helpers/app_harness.dart';

final _center = AdminRoutes.section(AdminSection.moderation);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a moderator approves a listing and it shows in the log', (
    tester,
  ) async {
    await openApp(tester, _center, role: 'moderator');
    // The card's title and its cover both name the book.
    expect(find.text('Organic Chemistry'), findsWidgets);
    expect(find.text('Some highlighting in chapters 3 to 5.'), findsOneWidget);

    await tester.tap(find.text('Approve').first);
    await settle(tester);
    expect(tester.takeException(), isNull);
    // The oldest in the queue comes first.
    expect(find.text('Artificial Intelligence is live.'), findsOneWidget);

    // The tab bar scrolls on a phone.
    await tester.ensureVisible(find.text('Log'));
    await tester.pump();
    await tester.tap(find.text('Log'));
    await settle(tester);
    expect(find.text('Approved Artificial Intelligence'), findsOneWidget);
  });

  testWidgets('rejecting asks for a reason the seller sees', (tester) async {
    await openApp(tester, _center, role: 'moderator');
    await tester.tap(find.text('Reject').first);
    await settle(tester);
    expect(find.text('Why is it rejected?'), findsOneWidget);

    await tester.tap(find.text('This looks like a photocopy'));
    await tester.pump();
    await tester.tap(find.text('Send'));
    await settle(tester);
    expect(find.textContaining('was rejected.'), findsOneWidget);
  });

  testWidgets('a moderator bans a reported reader', (tester) async {
    await openApp(tester, _center, role: 'moderator');
    await tester.tap(find.text('Reports'));
    await settle(tester);
    expect(find.text('Harassment or hate'), findsOneWidget);
    expect(find.text('Photocopy or pirated book'), findsOneWidget);
    expect(find.textContaining('2 reports'), findsOneWidget);

    final ban = find.text('Ban');
    await tester.ensureVisible(ban.first);
    await tester.pump();
    await tester.tap(ban.first);
    await settle(tester);
    // The oldest case comes first: Rafi, reported for harassment.
    expect(find.text('Ban Rafi?'), findsOneWidget);
    await tester.tap(find.text('Ban').last);
    await settle(tester);
    expect(find.text("Done. It's in the log."), findsOneWidget);
    expect(find.text('Harassment or hate'), findsNothing);
    expect(find.text('Photocopy or pirated book'), findsOneWidget);
  });
}

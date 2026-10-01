import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/handled_sale/handled_sale_routes.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a buyer pays through Waraqah and the money is held', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      P2pRoutes.listingDetailFor('p2p-1'),
      role: 'reader',
    );
    final buy = find.text('Buy for ৳400');
    await tester.ensureVisible(buy);
    await tester.tap(buy);
    await settle(tester);
    expect(find.text('Pay ৳400'), findsOneWidget);

    await tester.tap(find.text('Pay ৳400'));
    await settle(tester);
    expect(pathOf(router), startsWith('/sales/HS-'));
    expect(
      find.text(
        'Waraqah is holding ৳400. Tanvir will hand the book to the courier.',
      ),
      findsOneWidget,
    );
    // The demo seller sends it a few seconds later.
    await tester.pump(const Duration(seconds: 5));
    await settle(tester);
  });

  testWidgets('the buyer confirms the book, or reports a problem', (
    tester,
  ) async {
    await openApp(tester, HandledSaleRoutes.saleFor('HS-101'), role: 'reader');
    await tester.tap(find.text('Report a problem'));
    await settle(tester);
    await tester.tap(find.text('Damaged'));
    await tester.pump();
    await tester.tap(find.text('Send to a moderator'));
    await settle(tester);
    expect(find.text('Sent. A moderator will look at it.'), findsOneWidget);
    expect(find.text('In dispute'), findsOneWidget);
  });

  testWidgets('the seller marks it sent and sees earnings', (tester) async {
    final router = await openApp(
      tester,
      HandledSaleRoutes.saleFor('HS-103'),
      role: 'reader',
    );
    await tester.tap(find.text('Mark as sent'));
    await settle(tester);
    expect(find.text('On its way'), findsOneWidget);

    router.push(HandledSaleRoutes.earnings);
    await settle(tester);
    expect(find.text('Held by Waraqah'), findsOneWidget);
    expect(find.text('৳209'), findsOneWidget);
  });

  testWidgets('a moderator refunds a disputed sale', (tester) async {
    await openApp(
      tester,
      AdminRoutes.section(AdminSection.moderation),
      role: 'moderator',
    );
    // The tab bar scrolls on a phone.
    await tester.ensureVisible(find.text('Disputes'));
    await tester.pump();
    await tester.tap(find.text('Disputes'));
    await settle(tester);
    expect(find.text('Sadia bought from Tanvir'), findsOneWidget);

    await tester.tap(find.text('Refund the buyer'));
    await settle(tester);
    expect(find.text("Done. It's in the log."), findsOneWidget);
    expect(find.text('Sadia bought from Tanvir'), findsNothing);
  });
}

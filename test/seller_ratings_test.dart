import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/inbox/data/sources/inbox_fake_rating.dart';
import 'package:waraqah/features/inbox/data/sources/inbox_fake_selling.dart';
import 'package:waraqah/features/inbox/data/sources/inbox_fake_store.dart';
import 'package:waraqah/features/inbox/domain/entities/rating_rules.dart';
import 'package:waraqah/features/inbox/inbox_routes.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_store.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_seller_json.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('a rating is 1 to 5 stars with a short comment', () {
    expect(RatingRules.check(stars: 0), RatingProblem.stars);
    expect(RatingRules.check(stars: 6), RatingProblem.stars);
    expect(
      RatingRules.check(stars: 4, comment: 'x' * 301),
      RatingProblem.tooLong,
    );
    expect(RatingRules.check(stars: 4, comment: 'Lovely'), isNull);
  });

  test('ratings come after the sale, once, and show on the seller page', () {
    final p2p = P2pFakeStore();
    final inbox = InboxFakeStore(p2p, replyDelay: Duration.zero);
    expect(inbox.rate('th-sadia', 5, null), isNull, reason: 'not sold yet');

    expect(inbox.rate('th-talha', 4, 'Well packed'), isNotNull);
    expect(inbox.rate('th-talha', 5, null), isNull, reason: 'once');

    final talha = p2p.sellerJson('p-talha')!;
    // Arif's 5 and the reader's 4.
    expect((talha['ratingCount'], talha['ratingAverage']), (2, 4.5));
    // 4 before the app, plus Operating Systems.
    expect(talha['booksSold'], 5);

    inbox.decide('th-sadia', 'o-sadia', accept: true);
    inbox.markSold('th-sadia');
    expect(inbox.rate('th-sadia', 5, null), isNotNull);
  });

  testWidgets("a listing's seller row opens the seller page", (tester) async {
    await openApp(tester, P2pRoutes.listingDetailFor('p2p-4'), role: 'reader');
    await tester.scrollUntilVisible(find.text('Nabila · Banani, Dhaka'), 200);
    expect(find.text('4.8 · 4 ratings · 18 books sold'), findsOneWidget);

    await tester.tap(find.text('Nabila · Banani, Dhaka'));
    await settle(tester);
    expect(tester.takeException(), isNull);
    expect(find.text('Member since Nov 2023'), findsOneWidget);
    expect(find.text('Lovely seller, wrapped the book too!'), findsOneWidget);
    // Her only book is reserved, so nothing is on sale.
    expect(find.text('Nothing on sale right now.'), findsOneWidget);
  });

  testWidgets('the buyer rates the seller after the sale', (tester) async {
    await openApp(tester, InboxRoutes.threadFor('th-talha'), role: 'reader');
    await settle(tester);
    expect(find.text('You bought this book'), findsOneWidget);
    expect(find.text('Talha rated you'), findsOneWidget);

    await tester.tap(find.byTooltip('4 stars'));
    await tester.pump();
    await tester.enterText(find.byType(TextField).first, 'Well packed');
    await tester.tap(find.text('Send rating'));
    await settle(tester);
    expect(find.text('You rated Talha'), findsOneWidget);
    expect(find.text('How was the deal with Talha?'), findsNothing);
  });
}

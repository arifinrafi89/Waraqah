import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/p2p/domain/entities/fair_price.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';
import 'package:waraqah/features/scan/scan_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('the fair range follows the new price, condition and flags', () {
    final likeNew = FairPrice.of(
      newPriceBdt: 500,
      condition: BookCondition.likeNew,
    )!;
    expect((likeNew.lowBdt, likeNew.highBdt), (300, 380));

    final flagged = FairPrice.of(
      newPriceBdt: 500,
      condition: BookCondition.good,
      flags: 1,
    )!;
    expect((flagged.lowBdt, flagged.highBdt), (180, 250));

    expect(
      FairPrice.of(newPriceBdt: null, condition: BookCondition.good),
      isNull,
    );
  });

  test('an asking price is low, fair, high, or as much as new', () {
    const fair = FairPrice(300, 380, 500);
    expect(fair.verdict(250), PriceVerdict.low);
    expect(fair.verdict(320), PriceVerdict.fair);
    expect(fair.verdict(450), PriceVerdict.high);
    expect(fair.verdict(500), PriceVerdict.aboveNew);
  });

  testWidgets('pricing a scanned book shows the meter and warns', (
    tester,
  ) async {
    await openApp(tester, ScanRoutes.scan, role: 'reader');
    await tester.enterText(find.byType(TextField).last, '9789840001491');
    await tester.tap(find.text('Find'));
    await settle(tester);
    await tester.tap(find.text('Sell your copy'));
    await settle(tester);

    for (var i = 0; i < 3; i++) {
      // The Stepper builds every step's buttons; tap the open step's.
      final next = find.text('Next').at(i);
      await tester.ensureVisible(next);
      await tester.pump();
      await tester.tap(next);
      await settle(tester);
    }
    // Calculus is ৳1,750 new; a Good copy fairly sells for 40–55% of it.
    expect(find.textContaining('Fair price:'), findsOneWidget);

    await tester.ensureVisible(find.byType(TextFormField).last);
    await tester.enterText(find.byType(TextFormField).last, '1800');
    await tester.pump();
    expect(find.textContaining('Buyers will buy new instead.'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).last, '800');
    await tester.pump();
    expect(find.text('A fair price.'), findsOneWidget);
  });
}

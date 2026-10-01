import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';
import 'package:waraqah/features/sell_back/data/sources/certified_used_stock.dart';
import 'package:waraqah/features/sell_back/data/sources/sell_back_fake_store.dart';
import 'package:waraqah/features/sell_back/domain/entities/sell_back.dart';
import 'package:waraqah/features/sell_back/domain/entities/sell_back_rules.dart';
import 'package:waraqah/features/sell_back/sell_back_routes.dart';
import 'package:waraqah/features/wallet/data/sources/wallet_fake_store.dart';

import 'helpers/app_harness.dart';

SellBackFakeStore _store() =>
    SellBackFakeStore(WalletFakeStore(), pickupDelay: const Duration(days: 1));

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('the quote follows the new price, condition and flags', () {
    expect(SellBackRules.quote(1000, BookCondition.likeNew), 350);
    expect(SellBackRules.quote(1000, BookCondition.likeNew, flags: 1), 300);
    expect(SellBackRules.quote(100, BookCondition.acceptable), 30);
    expect(SellBackRules.resellPrice(1000, BookCondition.good), 450);
  });

  test('a Sell Back is booked, graded, paid and put on sale', () {
    final store = _store();
    const draft = SellBackDraft(
      bookId: 'bk-sapiens',
      condition: BookCondition.good,
      pickupAddress: 'x',
    );
    expect(store.create(draft), isNull, reason: 'no real address');
    final booked = store.create(
      draft.copyWith(pickupAddress: 'Road 7, Dhanmondi'),
    )!;
    expect(booked.status, SellBackStatus.scheduled);

    // Nabila's Calculus and the reader's Sapiens were picked up.
    final queue = store.queue();
    expect(queue.map((s) => s.readerName), ['Nabila', 'You']);

    final balance = store.wallet.balance;
    expect(store.grade('SB-203', BookCondition.good, accept: true), isTrue);
    expect(store.wallet.balance, greaterThan(balance));
    expect(CertifiedUsedStock.copy('cu-sapiens-2'), isNotNull);
    expect(store.grade('SB-203', BookCondition.good, accept: true), isFalse);

    store.grade('SB-202', BookCondition.good, accept: false);
    expect(store.queue(), isEmpty);
  });

  testWidgets('a reader gets a quote and books a pickup', (tester) async {
    final router = await openApp(
      tester,
      SellBackRoutes.sellBack,
      role: 'reader',
    );
    await tester.enterText(find.byType(TextField).first, 'zero');
    await settle(tester);
    // The title and the little cover both say it.
    await tester.tap(find.text('Zero to One').last);
    await tester.pump();
    expect(find.textContaining('Waraqah pays'), findsOneWidget);

    await tester.enterText(find.byType(TextField).last, 'Road 7, Dhanmondi');
    await tester.pump();
    final accept = find.textContaining('and book a pickup');
    await tester.ensureVisible(accept);
    await tester.tap(accept);
    await settle(tester);
    expect(pathOf(router), SellBackRoutes.mine);
    expect(find.text('Pickup booked'), findsOneWidget);
    // The demo courier collects it a few seconds later.
    await tester.pump(const Duration(seconds: 5));
    await settle(tester);
  });

  testWidgets('staff grade a trade-in and publish it', (tester) async {
    await openApp(
      tester,
      AdminRoutes.section(AdminSection.tradeIn),
      role: 'catalogManager',
    );
    expect(find.textContaining('Sold by Nabila'), findsOneWidget);
    await tester.tap(find.textContaining('Pay ').first);
    await settle(tester);
    expect(find.text('Paid, and on sale as Certified Used.'), findsOneWidget);
    expect(find.textContaining('Sold by Nabila'), findsNothing);
  });
}

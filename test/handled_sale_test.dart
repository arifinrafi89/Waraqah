import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/checkout/domain/entities/payment_method.dart';
import 'package:waraqah/features/handled_sale/data/sources/handled_sale_fake_money.dart';
import 'package:waraqah/features/handled_sale/data/sources/handled_sale_fake_steps.dart';
import 'package:waraqah/features/handled_sale/data/sources/handled_sale_fake_store.dart';
import 'package:waraqah/features/handled_sale/domain/entities/handled_sale.dart';
import 'package:waraqah/features/handled_sale/domain/entities/sale_math.dart';
import 'package:waraqah/features/handled_sale/domain/repositories/handled_sale_repository.dart';
import 'package:waraqah/features/moderation/data/sources/moderation_fake_store.dart';
import 'package:waraqah/features/moderation/domain/entities/audit_entry.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_store.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';
import 'package:waraqah/features/report/data/sources/report_fake_store.dart';
import 'package:waraqah/features/wallet/data/sources/wallet_fake_store.dart';

HandledSaleFakeStore _store() {
  final p2p = P2pFakeStore();
  return HandledSaleFakeStore(
    p2p,
    WalletFakeStore(),
    moderation: ModerationFakeStore(p2p, ReportFakeStore(p2p)),
    sendDelay: const Duration(days: 1),
  );
}

void main() {
  test('the buyer pays delivery; Waraqah keeps 5% (at least ৳10)', () {
    expect(SaleMath.buyerPays(320), 400);
    expect(SaleMath.feeFor(300), 15);
    expect(SaleMath.feeFor(100), 10);
    expect(SaleMath.sellerGets(300), 285);
  });

  test('paying holds the money and reserves the book', () {
    final store = _store();
    expect(store.buy('p2p-1', PaymentMethod.cashOnDelivery), isNull);
    expect(store.buy('p2p-7', PaymentMethod.bkash), isNull, reason: 'mine');

    final sale = store.buy('p2p-1', PaymentMethod.bkash)!;
    expect(sale.status, SaleStatus.paid);
    expect(store.p2p.find('p2p-1')!.status, P2pListingStatus.reserved);

    final balance = store.wallet.balance;
    store.step(sale.id, SaleStep.cancel);
    expect(store.wallet.balance, balance + 400);
    expect(store.p2p.find('p2p-1')!.status, P2pListingStatus.live);
  });

  test('confirming pays the seller and sells the book', () {
    final store = _store();
    expect(store.step('HS-101', SaleStep.send), isNull, reason: 'buyer');
    store.step('HS-101', SaleStep.confirm);
    expect(store.sales['HS-101']!.status, SaleStatus.completed);
    expect(store.p2p.find('p2p-hs-1')!.status, P2pListingStatus.sold);
  });

  test('a dispute waits for a moderator, who can refund', () {
    final store = _store();
    store.dispute('HS-101', DisputeReason.damaged, 'Torn cover', const []);
    expect(store.disputesJson(), hasLength(2));

    final balance = store.wallet.balance;
    expect(store.settle('HS-101', refund: true, by: 'Mod'), isTrue);
    expect(store.wallet.balance, balance + 460);
    expect(store.p2p.find('p2p-hs-1')!.status, P2pListingStatus.live);
    expect(store.moderation!.log.last.action, AuditAction.refunded);

    store.settle('HS-104', refund: false, by: 'Mod');
    expect(store.sales['HS-104']!.status, SaleStatus.released);
  });

  test('earnings add up held, earned and paid out', () {
    final store = _store();
    final earnings = store.earningsJson();
    // The Alchemist (৳220) is paid and waiting: ৳209 after the fee.
    expect(earnings['heldBdt'], 209);
    // Deep Work, already paid out.
    expect((earnings['earnedBdt'], earnings['paidOutBdt']), (285, 285));
    expect(store.payout(), isFalse, reason: 'nothing ready');
  });
}

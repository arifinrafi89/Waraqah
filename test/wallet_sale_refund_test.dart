import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/handled_sale/data/sources/handled_sale_fake_api.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/wallet/data/sources/wallet_fake_api.dart';
import 'package:waraqah/features/wallet/wallet_routes.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('handled-sale refunds have their own reason and the book', () async {
    final backend = FakeBackend();
    // The reader's on-its-way sale goes to a moderator, who refunds it.
    await backend.post(HandledSaleFakeApi.dispute, {
      'id': 'HS-101',
      'reason': 'damaged',
    });
    await backend.post(HandledSaleFakeApi.settle, {
      'id': 'HS-101',
      'refund': true,
      'by': 'Mod',
    });
    final wallet = (await backend.dio.get<Map<String, dynamic>>(
      WalletFakeApi.wallet,
    )).data!;
    final entry = (wallet['entries'] as List).cast<Map>().firstWhere(
      (e) => e['orderNumber'] == 'HS-101',
    );
    expect(entry['reason'], 'saleRefund');
    expect(entry['note'], isNotEmpty);
  });

  testWidgets('cancelling a sale shows the book in the wallet', (tester) async {
    final router = await openApp(
      tester,
      P2pRoutes.listingDetailFor('p2p-1'),
      role: 'reader',
    );
    final buy = find.text('Buy for ৳400');
    await tester.ensureVisible(buy);
    await tester.tap(buy);
    await settle(tester);
    await tester.tap(find.text('Pay ৳400'));
    await settle(tester);
    await tester.tap(find.text('Cancel and refund'));
    await settle(tester);

    router.go(WalletRoutes.wallet);
    await settle(tester);
    expect(find.text('Refund for used book: Clean Code'), findsOneWidget);
  });
}

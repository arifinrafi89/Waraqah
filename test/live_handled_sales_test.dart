import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/handled_sale/data/sources/handled_sale_fake_api.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';

import 'helpers/app_harness.dart';
import 'helpers/fake_backend.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('every move on a sale goes out on the live feed', () async {
    final backend = FakeBackend();
    final seen = <String>[];
    final sub = backend.stores.handledSales.live.stream().stream.listen(
      (bytes) => seen.add(String.fromCharCodes(bytes)),
    );
    await backend.post(HandledSaleFakeApi.step, {
      'id': 'HS-103',
      'step': 'send',
    });
    await Future<void>.delayed(Duration.zero);
    expect(seen.single, contains('"saleId":"HS-103"'));
    await sub.cancel();
  });

  testWidgets("the buyer's sale page follows the seller's move", (
    tester,
  ) async {
    await openApp(tester, P2pRoutes.listingDetailFor('p2p-1'), role: 'reader');
    final buy = find.text('Buy for ৳400');
    await tester.ensureVisible(buy);
    await tester.tap(buy);
    await settle(tester);
    await tester.tap(find.text('Pay ৳400'));
    await settle(tester);
    expect(find.text('On its way'), findsNothing);

    // The demo seller sends it a few seconds later; nobody refreshes.
    await tester.pump(const Duration(seconds: 5));
    await settle(tester);
    expect(find.text('On its way'), findsWidgets);
  });
}

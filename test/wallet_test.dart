import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/checkout/presentation/widgets/wallet_card.dart';
import 'package:waraqah/features/orders/orders_routes.dart';
import 'package:waraqah/features/wallet/wallet_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('guests log in to see a wallet', (tester) async {
    final router = await openApp(tester, WalletRoutes.wallet);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('the wallet shows its balance and where it came from', (
    tester,
  ) async {
    await openApp(tester, WalletRoutes.wallet, role: 'reader');
    expect(tester.takeException(), isNull);
    expect(find.text('৳180'), findsOneWidget);
    expect(find.text('Sell Back: Zero to One'), findsOneWidget);
  });

  testWidgets('pay from the wallet, then cancel and get it all back', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-atomic'),
      role: 'reader',
    );
    await tester.tap(find.text('Buy now'));
    await settle(tester);
    await tester.tap(find.text('Checkout'));
    await settle(tester);

    final walletSwitch = find.descendant(
      of: find.byType(WalletCard),
      matching: find.byType(Switch),
    );
    await tester.dragUntilVisible(
      walletSwitch,
      find.byType(ListView),
      const Offset(0, -200),
    );
    await tester.ensureVisible(walletSwitch);
    await settle(tester);
    expect(find.text('Pay ৳180 from your wallet'), findsOneWidget);
    await tester.tap(walletSwitch);
    await tester.pump();
    // ৳590 + ৳60 delivery - ৳180 from the wallet.
    expect(find.text('৳470'), findsWidgets);

    await tester.tap(find.text('Place order'));
    await settle(tester);
    expect(find.text('Paid ৳470 with bKash'), findsOneWidget);
    expect(find.text('৳180 came from your wallet.'), findsOneWidget);

    router.push(OrdersRoutes.detailsFor('WQ-100231'));
    await settle(tester);
    await tester.scrollUntilVisible(find.text('Cancel order'), 200);
    await tester.tap(find.text('Cancel order'));
    await settle(tester);
    await tester.tap(find.text('Cancel order').last);
    await settle(tester);

    router.push(WalletRoutes.wallet);
    await settle(tester);
    // ৳470 paid with bKash + ৳180 from the wallet.
    expect(find.text('৳650'), findsOneWidget);
    expect(find.text('Refund for cancelled WQ-100231'), findsOneWidget);
    expect(find.text('Used on WQ-100231'), findsOneWidget);
  });

  testWidgets('an approved return refunds the books to the wallet', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      OrdersRoutes.detailsFor('WQ-100201'),
      role: 'superAdmin',
    );
    await tester.scrollUntilVisible(find.text('Request a return'), 200);
    await tester.tap(find.text('Request a return'));
    await settle(tester);
    await tester.tap(find.text('Send request'));
    await settle(tester);

    router.push(AdminRoutes.section(AdminSection.orders));
    await settle(tester);
    await tester.tap(find.text('Returns'));
    await settle(tester);
    await tester.tap(find.text('Approve'));
    await settle(tester);

    router.push(WalletRoutes.wallet);
    await settle(tester);
    // ৳180 + the books of WQ-100201 (৳650 + ৳590), not its delivery.
    expect(find.text('৳1,420'), findsOneWidget);
    expect(find.text('Refund for returned WQ-100201'), findsOneWidget);
  });
}

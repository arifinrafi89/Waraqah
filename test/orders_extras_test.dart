import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/cart/cart_routes.dart';
import 'package:waraqah/features/cart/data/sources/cart_fake_store.dart';
import 'package:waraqah/features/checkout/domain/entities/payment_method.dart';
import 'package:waraqah/features/orders/data/models/order_model.dart';
import 'package:waraqah/features/orders/data/models/order_parts_model.dart';
import 'package:waraqah/features/orders/data/sources/order_reorder.dart';
import 'package:waraqah/features/orders/domain/entities/order_status.dart';
import 'package:waraqah/features/orders/orders_routes.dart';

import 'helpers/app_harness.dart';

OrderLineModel _line(String? editionId, int quantity) => OrderLineModel(
  bookId: 'b',
  title: 'T',
  author: 'A',
  quantity: quantity,
  unitPriceBdt: 100,
  editionId: editionId,
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('buy again adds what can be bought and counts the rest', () {
    final cart = CartFakeStore();
    final order = OrderModel(
      number: 'WQ-1',
      placedAt: DateTime(2026),
      status: OrderStatus.delivered,
      lines: [
        _line('bk-atomic-pb-en', 2),
        _line(null, 1), // a used copy
        _line('bk-calculus-pb-en', 1), // out of stock
      ],
      history: const [],
      addressLabel: '',
      addressLine: '',
      payment: PaymentMethod.bkash,
      subtotalBdt: 0,
      deliveryFeeBdt: 0,
      discountBdt: 0,
      totalBdt: 0,
    );
    final result = reorderInto(order, cart);
    expect((result.added, result.skipped), (2, 2));
    expect(cart.toJson()['lines'], hasLength(1));
  });

  testWidgets('a delivered order can be bought again', (tester) async {
    final router = await openApp(
      tester,
      OrdersRoutes.detailsFor('WQ-100201'),
      role: 'reader',
    );
    await tester.scrollUntilVisible(find.text('Buy again'), 200);
    await tester.tap(find.text('Buy again'));
    await settle(tester);
    expect(pathOf(router), CartRoutes.cart);
    expect(find.text('2 books are back in your cart.'), findsOneWidget);
    // Let the message go and the cart finish loading.
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();
    await tester.pump(const Duration(seconds: 5));
    await settle(tester);
  });

  testWidgets('an order on its way has an invoice but no buy again', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      OrdersRoutes.detailsFor('WQ-100215'),
      role: 'reader',
    );
    await tester.scrollUntilVisible(find.text('Invoice'), 200);
    expect(find.text('Buy again'), findsNothing);

    await tester.tap(find.text('Invoice'));
    await settle(tester);
    expect(pathOf(router), OrdersRoutes.invoiceFor('WQ-100215'));
    expect(tester.takeException(), isNull);
    expect(find.text('Waraqah · Invoice'), findsOneWidget);
    expect(find.textContaining('1 × ৳520'), findsOneWidget);
  });

  testWidgets('anyone can read the return policy', (tester) async {
    await openApp(tester, OrdersRoutes.returnPolicy);
    expect(tester.takeException(), isNull);
    expect(find.text('Returns and refunds'), findsOneWidget);
    expect(find.text('Within 7 days of delivery'), findsOneWidget);
  });
}

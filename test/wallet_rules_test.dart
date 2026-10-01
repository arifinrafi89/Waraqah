import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/catalog/domain/entities/delivery_area.dart';
import 'package:waraqah/features/checkout/domain/entities/checkout_totals.dart';
import 'package:waraqah/features/checkout/domain/entities/payment_method.dart';
import 'package:waraqah/features/orders/domain/entities/order.dart';
import 'package:waraqah/features/orders/domain/entities/order_refunds.dart';
import 'package:waraqah/features/orders/domain/entities/order_status.dart';
import 'package:waraqah/features/wallet/data/sources/wallet_fake_store.dart';
import 'package:waraqah/features/wallet/domain/entities/wallet.dart';

final _cart = Cart(
  lines: [
    CartLine(
      id: 'l1',
      kind: CartItemKind.edition,
      itemId: 'e1',
      bookId: 'b1',
      title: 'T',
      author: 'A',
      unitPriceBdt: 500,
      quantity: 1,
      maxQuantity: 10,
      format: BookFormat.paperback,
    ),
  ],
);

CheckoutTotals _totals(int balance, {bool use = true}) => CheckoutTotals.of(
  _cart,
  DeliveryArea.insideDhaka,
  walletBalance: balance,
  useWallet: use,
);

Order _order(PaymentMethod payment) => Order(
  number: 'WQ-1',
  placedAt: DateTime(2026),
  status: OrderStatus.placed,
  lines: const [],
  history: const [],
  addressLabel: '',
  addressLine: '',
  payment: payment,
  subtotalBdt: 590,
  deliveryFeeBdt: 60,
  discountBdt: 0,
  totalBdt: 550,
  walletUsedBdt: 100,
);

void main() {
  test('the wallet pays last, up to what the order comes to', () {
    // ৳500 + ৳60 delivery.
    expect((_totals(180).walletBdt, _totals(180).totalBdt), (180, 380));
    expect((_totals(900).walletBdt, _totals(900).totalBdt), (560, 0));
    expect(_totals(180, use: false).walletBdt, 0);
    expect(_totals(180).beforeWalletBdt, 560);
  });

  test('cancelling refunds what was paid; cash on delivery was not', () {
    expect(_order(PaymentMethod.bkash).cancelRefundBdt, 650);
    expect(_order(PaymentMethod.cashOnDelivery).cancelRefundBdt, 100);
  });

  test('a return refunds the books, not delivery', () {
    expect(_order(PaymentMethod.cashOnDelivery).returnRefundBdt, 590);
  });

  test('the fake wallet never spends more than it holds', () {
    final wallet = WalletFakeStore();
    expect(wallet.balance, 180);
    expect(wallet.spend('WQ-1', 500), 180);
    expect(wallet.balance, 0);
    wallet.credit(650, WalletReason.cancelRefund, orderNumber: 'WQ-1');
    expect(wallet.balance, 650);
  });
}

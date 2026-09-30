import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/checkout/domain/entities/payment_method.dart';
import 'package:waraqah/features/orders/data/models/order_model.dart';
import 'package:waraqah/features/orders/data/models/order_parts_model.dart';
import 'package:waraqah/features/orders/data/sources/order_fake_store.dart';
import 'package:waraqah/features/orders/domain/entities/order_return.dart';
import 'package:waraqah/features/orders/domain/entities/order_status.dart';

/// Seeded: WQ-100201 delivered two days ago, WQ-100215 shipped.
final _now = DateTime(2026, 9, 30, 12);

OrderModel _placed(OrderFakeStore store) => OrderModel(
  number: store.nextNumber(),
  placedAt: _now,
  status: OrderStatus.placed,
  lines: const [],
  history: [StatusChangeModel(status: OrderStatus.placed, at: _now)],
  addressLabel: 'Home',
  addressLine: 'Dhanmondi, Dhaka',
  payment: PaymentMethod.bkash,
  subtotalBdt: 500,
  deliveryFeeBdt: 60,
  discountBdt: 0,
  totalBdt: 560,
);

void main() {
  late OrderFakeStore store;
  setUp(() => store = OrderFakeStore(clock: () => _now));

  test('newest first; new orders count on from WQ-100231', () {
    expect([for (final o in store.all) o.number], ['WQ-100215', 'WQ-100201']);
    store.add(_placed(store));
    expect(store.all.first.number, 'WQ-100231');
  });

  test('an order can be cancelled until it ships', () {
    store.add(_placed(store));
    final cancelled = store.cancel('WQ-100231')!;
    expect(cancelled.status, OrderStatus.cancelled);
    expect(cancelled.history.last.status, OrderStatus.cancelled);

    expect(store.cancel('WQ-100215'), isNull, reason: 'already shipped');
    expect(store.cancel('WQ-100231'), isNull, reason: 'already cancelled');
  });

  test('a return can be asked for once, within 7 days of delivery', () {
    final order = store.requestReturn('WQ-100201', ReturnReason.damaged, 'Torn');
    expect(order!.returnRequest!.status, ReturnStatus.requested);
    expect(order.returnRequest!.note, 'Torn');

    expect(
      store.requestReturn('WQ-100201', ReturnReason.other, ''),
      isNull,
      reason: 'already asked',
    );
    expect(
      store.requestReturn('WQ-100215', ReturnReason.damaged, ''),
      isNull,
      reason: 'not delivered yet',
    );
  });

  test('returns close 7 days after delivery', () {
    var now = _now;
    final ticking = OrderFakeStore(clock: () => now);
    // Delivered two days before the store opened; six more days is eight.
    now = now.add(const Duration(days: 6));
    expect(
      ticking.requestReturn('WQ-100201', ReturnReason.damaged, ''),
      isNull,
    );
  });
}

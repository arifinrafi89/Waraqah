import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/cart/presentation/controllers/cart_controller.dart';
import 'package:waraqah/features/orders/data/order_providers.dart';
import 'package:waraqah/features/orders/data/repositories/dummy_order_repository.dart';
import 'package:waraqah/features/orders/domain/models/order.dart';
import 'package:waraqah/features/orders/domain/repositories/order_repository.dart';

class _RecordingOrderRepository implements OrderRepository {
  final List<Order> added = [];
  final DummyOrderRepository _inner = DummyOrderRepository();

  @override
  List<Order> getOrders() => _inner.getOrders();

  @override
  List<Order> addOrder(Order order) {
    added.add(order);
    return _inner.addOrder(order);
  }
}

void main() {
  testWidgets('Placing an order writes through to OrderRepository', (
    tester,
  ) async {
    final repository = _RecordingOrderRepository();
    final container = ProviderContainer(
      overrides: [orderRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);

    AppRouter.router.go('/checkout');
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Phone'),
      '01700000000',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Address line'),
      'House 1, Road 2',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'City'), 'Dhaka');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Place order'));
    await tester.pumpAndSettle();

    expect(find.text('My Orders'), findsOneWidget);
    expect(repository.added, hasLength(1));
    expect(repository.added.single.status, OrderStatus.pending);
    expect(container.read(cartItemsProvider), isEmpty);
  });
}

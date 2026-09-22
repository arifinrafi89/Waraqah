import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/cart/presentation/controllers/cart_controller.dart';
import 'package:waraqah/features/orders/data/order_providers.dart';

Future<ProviderContainer> _pumpCheckout(WidgetTester tester) async {
  final container = ProviderContainer();
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
  return container;
}

void main() {
  testWidgets('empty cart shows the empty-cart state instead of a form', (
    tester,
  ) async {
    final container = await _pumpCheckout(tester);
    container.read(cartItemsProvider.notifier).clear();
    await tester.pumpAndSettle();

    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Place order'), findsNothing);
  });

  testWidgets(
    'Place order on an invalid form shows field errors and creates no order',
    (tester) async {
      final container = await _pumpCheckout(tester);
      final ordersBefore = (await container.read(ordersProvider.future)).length;

      await tester.tap(find.widgetWithText(ElevatedButton, 'Place order'));
      await tester.pumpAndSettle();

      expect(find.text('Phone is required'), findsOneWidget);
      expect(find.text('Address line is required'), findsOneWidget);
      expect(find.text('City is required'), findsOneWidget);
      expect((await container.read(ordersProvider.future)).length, ordersBefore);
    },
  );

  testWidgets(
    'placing a valid order empties the cart and prepends a pending order',
    (tester) async {
      final container = await _pumpCheckout(tester);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Phone'),
        '01700000000',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Address line'),
        'House 1, Road 2',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'City'),
        'Dhaka',
      );

      await tester.tap(find.widgetWithText(ElevatedButton, 'Place order'));
      await tester.pumpAndSettle();

      expect(container.read(cartItemsProvider), isEmpty);
      expect((await container.read(ordersProvider.future)).first.status.name, 'pending');
      expect(find.text('My Orders'), findsOneWidget);
    },
  );
}

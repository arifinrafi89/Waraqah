import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<ProviderContainer> _pumpApp(WidgetTester tester, String location) async {
  final container = ProviderContainer();
  addTearDown(container.dispose);

  AppRouter.router.go(location);
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

Future<void> _goto(WidgetTester tester, String location) async {
  AppRouter.router.go(location);
  await tester.pumpAndSettle();
}

Finder _summaryRow(String label) =>
    find.ancestor(of: find.text(label), matching: find.byType(Row)).first;

String _valueOf(WidgetTester tester, String label) => tester
    .widget<Text>(
      find.descendant(of: _summaryRow(label), matching: find.byType(Text)).last,
    )
    .data!;

void main() {
  testWidgets('Cart and checkout show the same Delivery and Total', (
    tester,
  ) async {
    await _pumpApp(tester, '/cart');
    final cartDelivery = _valueOf(tester, 'Delivery');
    final cartTotal = _valueOf(tester, 'Total');

    await _goto(tester, '/checkout');
    final checkoutDelivery = _valueOf(tester, 'Delivery');
    final checkoutTotal = _valueOf(tester, 'Total');

    expect(checkoutDelivery, cartDelivery);
    expect(checkoutTotal, cartTotal);
  });

  testWidgets('The agreement survives a cart edit', (tester) async {
    await _pumpApp(tester, '/cart');
    final totalBefore = _valueOf(tester, 'Total');

    await tester.tap(find.byIcon(Icons.add_rounded).first);
    await tester.pumpAndSettle();

    final cartDelivery = _valueOf(tester, 'Delivery');
    final cartTotal = _valueOf(tester, 'Total');
    expect(cartTotal, isNot(totalBefore));

    await _goto(tester, '/checkout');
    final checkoutDelivery = _valueOf(tester, 'Delivery');
    final checkoutTotal = _valueOf(tester, 'Total');

    expect(checkoutDelivery, cartDelivery);
    expect(checkoutTotal, cartTotal);
  });
}

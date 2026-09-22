import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/core/widgets/book_grid_card.dart';

Future<void> _pumpApp(WidgetTester tester, String route) async {
  AppRouter.router.go(route);
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Adding the same book twice increments rather than duplicating', (
    tester,
  ) async {
    await _pumpApp(tester, '/catalog');

    final card = find
        .ancestor(
          of: find.text('The Sealed Nectar'),
          matching: find.byType(BookGridCard),
        )
        .first;
    final addToCart = find.descendant(
      of: card,
      matching: find.widgetWithText(ElevatedButton, 'Add to cart'),
    );
    await tester.tap(addToCart);
    await tester.pumpAndSettle();
    await tester.tap(addToCart);
    await tester.pumpAndSettle();

    AppRouter.router.go('/cart');
    await tester.pumpAndSettle();

    expect(find.text('The Sealed Nectar'), findsOneWidget);
    expect(
      find.descendant(
        of: find.ancestor(
          of: find.text('The Sealed Nectar'),
          matching: find.byType(Row),
        ).first,
        matching: find.text('2'),
      ),
      findsOneWidget,
    );
  });

  testWidgets("Dropping a line's quantity to zero removes it", (
    tester,
  ) async {
    await _pumpApp(tester, '/cart');

    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);
    expect(find.text('Atomic Habits'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove_rounded).first);
    await tester.pumpAndSettle();

    expect(find.text('Sapiens: A Brief History of Humankind'), findsNothing);
    expect(find.text('Atomic Habits'), findsOneWidget);
  });
}

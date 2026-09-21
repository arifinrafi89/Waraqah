import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<void> _pumpP2p(WidgetTester tester) async {
  AppRouter.router.go('/p2p');
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('P2pPage renders available listings as grid cards, excluding reserved/sold', (
    tester,
  ) async {
    await _pumpP2p(tester);

    expect(find.text('P2P'), findsWidgets);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.text('Clean Code'), findsWidgets);
    expect(find.text('The 7 Habits of Highly Effective People'), findsNothing);
    expect(find.text('The Great Gatsby'), findsNothing);
  });

  testWidgets('condition filter narrows cards to matching condition', (tester) async {
    await _pumpP2p(tester);

    expect(find.text('Clean Code'), findsWidgets);
    expect(find.text('Sapiens: A Brief History of Humankind'), findsWidgets);

    await tester.tap(find.text('Good').first);
    await tester.pumpAndSettle();

    expect(find.text('Clean Code'), findsWidgets);
    expect(find.text('Sapiens: A Brief History of Humankind'), findsNothing);
  });

  testWidgets('sort control reorders cards by price', (tester) async {
    await _pumpP2p(tester);

    await tester.tap(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Price: Low to High'));
    await tester.pumpAndSettle();

    var texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').toList();
    expect(
      texts.indexOf('Atomic Habits'),
      lessThan(texts.indexOf('Sapiens: A Brief History of Humankind')),
    );
    expect(
      texts.indexOf('Sapiens: A Brief History of Humankind'),
      lessThan(texts.indexOf('Clean Code')),
    );

    await tester.tap(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Price: High to Low'));
    await tester.pumpAndSettle();

    texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').toList();
    expect(
      texts.indexOf('Clean Code'),
      lessThan(texts.indexOf('Sapiens: A Brief History of Humankind')),
    );
    expect(
      texts.indexOf('Sapiens: A Brief History of Humankind'),
      lessThan(texts.indexOf('Atomic Habits')),
    );
  });

  testWidgets('tapping a card navigates to /p2p/:id', (tester) async {
    await _pumpP2p(tester);

    await tester.tap(find.text('Clean Code').first);
    await tester.pumpAndSettle();

    expect(find.text('Listing'), findsWidgets);
  });
}

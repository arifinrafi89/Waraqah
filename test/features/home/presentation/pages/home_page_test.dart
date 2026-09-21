import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<void> _pumpHome(WidgetTester tester) async {
  AppRouter.router.go('/home');
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
  testWidgets('HomePage renders all sections', (tester) async {
    await _pumpHome(tester);

    expect(find.text('AYAH OF THE DAY'), findsOneWidget);
    expect(find.text('All Books'), findsOneWidget);
    expect(find.text('Beneficial'), findsOneWidget);
    expect(find.text('Non-Beneficial'), findsOneWidget);
    expect(find.text('Book-Bites'), findsOneWidget);
    expect(find.text('New Books'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('From Students Near You'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('From Students Near You'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Catalog'), findsOneWidget);
    expect(find.text('P2P'), findsOneWidget);
    expect(find.text('Bites'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.byIcon(Icons.auto_awesome_rounded), findsOneWidget);
  });

  final navigationCases = <MapEntry<Finder, String>>[
    MapEntry(find.text('Catalog'), 'Catalog'),
    MapEntry(find.text('P2P'), 'P2P'),
    MapEntry(find.text('Bites'), 'Book-Bites'),
    MapEntry(find.text('Profile'), 'Profile'),
    MapEntry(find.byIcon(Icons.search_rounded), 'Search'),
    MapEntry(find.byIcon(Icons.shopping_bag_outlined), 'Cart'),
    MapEntry(find.byIcon(Icons.auto_awesome_rounded), 'AI Chat'),
  ];

  for (final entry in navigationCases) {
    testWidgets('tapping nav target navigates to PlaceholderPage(${entry.value})', (
      tester,
    ) async {
      await _pumpHome(tester);

      await tester.tap(entry.key);
      await tester.pumpAndSettle();

      expect(find.text(entry.value), findsWidgets);
    });
  }
}

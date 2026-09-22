import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/search/presentation/pages/search_page.dart';

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

  testWidgets('tapping search icon navigates to SearchPage', (tester) async {
    await _pumpHome(tester);

    await tester.tap(find.byIcon(Icons.search_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(SearchPage), findsOneWidget);
  });

  testWidgets('New Books filter chip narrows cards to matching isBeneficial value', (
    tester,
  ) async {
    await _pumpHome(tester);

    expect(find.text('Harry Potter and the Philosopher\'s Stone'), findsOneWidget);
    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);

    await tester.tap(find.text('Non-Beneficial'));
    await tester.pumpAndSettle();

    expect(find.text('Harry Potter and the Philosopher\'s Stone'), findsOneWidget);
    expect(find.text('Sapiens: A Brief History of Humankind'), findsNothing);
  });

  testWidgets('New Books sort control reorders cards by price then by rating', (
    tester,
  ) async {
    await _pumpHome(tester);

    await tester.scrollUntilVisible(
      find.text('Sort'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.ensureVisible(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Price: Low to High'));
    await tester.pumpAndSettle();

    var texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').toList();
    expect(
      texts.indexOf('Fortress of the Muslim'),
      lessThan(texts.indexOf('Sapiens: A Brief History of Humankind')),
    );
    expect(
      texts.indexOf('Sapiens: A Brief History of Humankind'),
      lessThan(texts.indexOf('Clean Code')),
    );

    await tester.scrollUntilVisible(
      find.text('Sort'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.ensureVisible(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rating: High to Low'));
    await tester.pumpAndSettle();

    texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').toList();
    expect(
      texts.indexOf('The Sealed Nectar'),
      lessThan(texts.indexOf('Sapiens: A Brief History of Humankind')),
    );
    expect(
      texts.indexOf('Sapiens: A Brief History of Humankind'),
      lessThan(texts.indexOf('The Great Gatsby')),
    );
  });
}

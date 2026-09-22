import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/search/presentation/pages/search_page.dart';

Future<void> _pumpSearch(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        home: const SearchPage(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('idle state shows popular genre chips', (tester) async {
    await _pumpSearch(tester);

    expect(find.text('Popular genres'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
  });

  testWidgets('typing filters case-insensitively by title, author and genre', (
    tester,
  ) async {
    await _pumpSearch(tester);

    await tester.enterText(find.byType(TextField), 'atomic');
    await tester.pumpAndSettle();

    expect(find.text('1 results'), findsOneWidget);
    expect(find.text('Atomic Habits'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'JAMES CLEAR');
    await tester.pumpAndSettle();
    expect(find.text('Atomic Habits'), findsOneWidget);
  });

  testWidgets('non-matching query shows no-matches state', (tester) async {
    await _pumpSearch(tester);

    await tester.enterText(find.byType(TextField), 'zzzznotabook');
    await tester.pumpAndSettle();

    expect(find.text('No books match "zzzznotabook"'), findsOneWidget);
  });

  testWidgets('clear button empties query and returns to idle state', (
    tester,
  ) async {
    await _pumpSearch(tester);

    await tester.enterText(find.byType(TextField), 'atomic');
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Popular genres'), findsOneWidget);
    expect(find.byIcon(Icons.close_rounded), findsNothing);
  });

  testWidgets('tapping a genre chip fills the query and shows results', (
    tester,
  ) async {
    await _pumpSearch(tester);

    await tester.tap(find.text('History'));
    await tester.pumpAndSettle();

    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);
  });
}

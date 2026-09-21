import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

void main() {
  testWidgets('stub routes render PlaceholderPage with matching title', (
    tester,
  ) async {
    const routeTitles = {
      '/p2p': 'P2P',
      '/book-bites': 'Book-Bites',
      '/profile': 'Profile',
      '/ai-chat': 'AI Chat',
      '/cart': 'Cart',
      '/search': 'Search',
      '/login': 'Login',
    };

    for (final entry in routeTitles.entries) {
      AppRouter.router.go(entry.key);
      await tester.pumpWidget(
        MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text(entry.value), findsWidgets);
    }
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

void main() {
  testWidgets('stub routes render PlaceholderPage with matching title', (
    tester,
  ) async {
    // Routes nested under AppRouter's StatefulShellRoute (p2p, book-bites,
    // profile) render inside the shell's own Scaffold as well as the stub
    // page's, so they show 2; standalone pushed routes show 1.
    const routeTitles = {
      '/p2p': (title: 'P2P', scaffoldCount: 2),
      '/book-bites': (title: 'Book-Bites', scaffoldCount: 2),
      '/profile': (title: 'Profile', scaffoldCount: 2),
      '/ai-chat': (title: 'AI Chat', scaffoldCount: 1),
      '/cart': (title: 'Cart', scaffoldCount: 1),
      '/search': (title: 'Search', scaffoldCount: 1),
      '/login': (title: 'Login', scaffoldCount: 1),
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

      expect(find.byType(Scaffold), findsNWidgets(entry.value.scaffoldCount));
      expect(find.text(entry.value.title), findsWidgets);
    }
  });
}

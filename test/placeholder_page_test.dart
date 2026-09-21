import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

void main() {
  testWidgets('stub routes render PlaceholderPage with matching title', (
    tester,
  ) async {
    const routeTitles = {
      '/ai-chat': (title: 'AI Chat', scaffoldCount: 1),
      '/cart': (title: 'Cart', scaffoldCount: 1),
      '/search': (title: 'Search', scaffoldCount: 1),
      '/login': (title: 'Login', scaffoldCount: 1),
      '/p2p/some-id': (title: 'Listing', scaffoldCount: 1),
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

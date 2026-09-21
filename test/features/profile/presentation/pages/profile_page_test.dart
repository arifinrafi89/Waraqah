import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<void> _pumpProfile(WidgetTester tester) async {
  AppRouter.router.go('/profile');
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
  testWidgets('ProfilePage header renders the hardcoded current user', (
    tester,
  ) async {
    await _pumpProfile(tester);

    expect(find.text('Profile'), findsWidgets);
    expect(find.text('Rahinur Bin Naushad'), findsOneWidget);
    expect(find.text('Islamic University of Technology'), findsOneWidget);
    expect(find.text('200041101'), findsOneWidget);
  });

  testWidgets('My Listings includes non-available listings', (tester) async {
    await _pumpProfile(tester);

    expect(find.text('My Listings'), findsOneWidget);
    // p2p-1 (available) and p2p-6 (sold) both belong to profile-1.
    expect(find.text('Clean Code'), findsWidgets);
    expect(find.text('The Great Gatsby'), findsWidgets);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/home/domain/models/p2p_listing.dart';

Future<void> _pumpCreateListing(WidgetTester tester) async {
  AppRouter.router.go('/p2p/create');
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
  testWidgets(
    'CreateListingPage renders book picker, price, condition and photo placeholder',
    (tester) async {
      await _pumpCreateListing(tester);

      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Price'), findsOneWidget);
      expect(
        find.byType(DropdownButtonFormField<P2pCondition>),
        findsOneWidget,
      );
      expect(find.text('Photo picker coming soon'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, 'List it'), findsOneWidget);
    },
  );

  testWidgets('CreateListingPage shows validation error on empty submit', (
    tester,
  ) async {
    await _pumpCreateListing(tester);

    await tester.tap(find.widgetWithText(FilledButton, 'List it'));
    await tester.pumpAndSettle();

    expect(find.text('Pick a book'), findsOneWidget);
    expect(find.text('Price is required'), findsOneWidget);
  });

  testWidgets('Submitting a listing adds it to the P2P feed', (tester) async {
    AppRouter.router.go('/p2p');
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    AppRouter.router.push('/p2p/create');
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Clean Code').last);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Price'),
      '999',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'List it'));
    await tester.pumpAndSettle();

    expect(find.text('P2P'), findsWidgets);
    expect(find.text('৳999'), findsWidgets);
  });
}

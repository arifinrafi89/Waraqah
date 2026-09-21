import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<void> _pumpCreatePost(WidgetTester tester) async {
  AppRouter.router.go('/book-bites/create');
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
  testWidgets('CreatePostPage renders content field and tagging picker', (
    tester,
  ) async {
    await _pumpCreatePost(tester);

    expect(
      find.widgetWithText(TextFormField, 'What are you reading?'),
      findsOneWidget,
    );
    expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Post'), findsOneWidget);
  });

  testWidgets('CreatePostPage shows validation error on empty submit', (
    tester,
  ) async {
    await _pumpCreatePost(tester);

    await tester.tap(find.widgetWithText(FilledButton, 'Post'));
    await tester.pumpAndSettle();

    expect(find.text('Content is required'), findsOneWidget);
  });

  testWidgets('Submitting a post adds it to the Book-Bites feed', (
    tester,
  ) async {
    AppRouter.router.go('/book-bites');
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'What are you reading?'),
      'A brand new book-bite from the compose form.',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Post'));
    await tester.pumpAndSettle();

    expect(find.text('Book-Bites'), findsOneWidget);
    expect(
      find.text('A brand new book-bite from the compose form.'),
      findsOneWidget,
    );
  });
}

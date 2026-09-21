import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<void> _pumpRegister(WidgetTester tester) async {
  AppRouter.router.go('/register');
  await tester.pumpWidget(
    MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('RegisterPage renders profile and auth fields', (tester) async {
    await _pumpRegister(tester);

    expect(find.text('Register'), findsWidgets);
    expect(find.widgetWithText(TextFormField, 'Full name'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'University'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Student ID'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
    expect(
      find.widgetWithText(FilledButton, 'Create account'),
      findsOneWidget,
    );
  });

  testWidgets('RegisterPage shows validation errors on empty submit', (
    tester,
  ) async {
    await _pumpRegister(tester);

    await tester.tap(find.widgetWithText(FilledButton, 'Create account'));
    await tester.pumpAndSettle();

    expect(find.text('Full name is required'), findsOneWidget);
    expect(find.text('University is required'), findsOneWidget);
    expect(find.text('Student ID is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });
}

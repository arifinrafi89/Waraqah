import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:waraqah/features/auth/presentation/pages/login_page.dart';
import 'auth_repository_test.dart';

void main() {
  testWidgets('LoginPage displays validation errors when fields are empty',
      (WidgetTester tester) async {
    final fakeDatasource = FakeAuthRemoteDatasource();
    final repository = AuthRepositoryImpl(fakeDatasource);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(repository),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Tap the 'Sign In' button with empty fields
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Verify validation error messages are displayed
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}


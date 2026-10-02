import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/core/settings/settings_provider.dart';
import 'package:waraqah/features/auth/domain/entities/auth_failure.dart';
import 'package:waraqah/features/auth/presentation/providers/auth_providers.dart';

import 'helpers/app_harness.dart';

Future<ProviderContainer> _container() async {
  SharedPreferences.setMockInitialValues({});
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
      dioProvider.overrideWithValue(
        Dio()..interceptors.add(FakeApiRoutes.interceptor()),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('the OTP form refuses a wrong code', (tester) async {
    await openApp(tester, '/login');
    await tester.tap(find.text('Sign Up').first);
    await tester.pumpAndSettle();
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'Nadia Rahman');
    await tester.enterText(fields.at(1), 'nadia@example.com');
    await tester.enterText(fields.at(2), 'secret12');
    await tester.enterText(fields.at(3), 'secret12');
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    await tester.tap(find.text('Create Account'));
    await settle(tester);
    expect(find.text('Demo code: 123456'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '654321');
    await tester.tap(find.text('Verify OTP').last);
    await settle(tester);
    expect(find.text('Wrong code. Try again.'), findsOneWidget);
  });

  test('123456 signs in with the typed name', () async {
    final container = await _container();
    final session = container.read(sessionProvider.notifier);
    await session.requestSignUpOtp(
      name: 'Nadia Rahman',
      contact: 'nadia@example.com',
      password: 'x',
    );
    await expectLater(
      session.verifySignUpOtp(contact: 'nadia@example.com', otp: '111111'),
      throwsA(AuthFailure.wrongCode),
    );
    await session.verifySignUpOtp(contact: 'nadia@example.com', otp: '123456');
    expect(container.read(sessionProvider)!.name, 'Nadia Rahman');
  });

  test('a phone sign-up gets an id from the number', () async {
    final container = await _container();
    final session = container.read(sessionProvider.notifier);
    await session.requestSignUpOtp(
      name: 'Rafi',
      contact: '01712345678',
      password: 'x',
    );
    await session.verifySignUpOtp(contact: '01712345678', otp: '123456');
    final user = container.read(sessionProvider)!;
    expect(user.id, 'user-01712345678');
    expect(user.email, '01712345678');
  });

  test('a password reset with a wrong code is refused', () async {
    final session = (await _container()).read(sessionProvider.notifier);
    await expectLater(
      session.resetPassword(contact: '01712345678', otp: '1', password: 'p'),
      throwsA(AuthFailure.wrongCode),
    );
  });
}

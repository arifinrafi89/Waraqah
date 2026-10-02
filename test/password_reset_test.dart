import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/app_harness.dart';

void main() {
  testWidgets('forgot password sends an OTP to a mobile number', (
    tester,
  ) async {
    await openApp(tester, '/login');

    await tester.tap(find.text('Forgot password?'));
    await tester.pumpAndSettle();
    expect(find.text('Mobile number'), findsOneWidget);

    await tester.tap(find.text('Send OTP'));
    await tester.pump();
    expect(
      find.text('Enter a valid Bangladesh mobile number.'),
      findsOneWidget,
    );

    await tester.enterText(find.byType(TextField), '01712345678');
    await tester.tap(find.text('Send OTP'));
    await settle(tester);

    expect(find.textContaining('01712345678'), findsOneWidget);
    expect(find.text('Verify OTP'), findsWidgets);
  });

  testWidgets('a wrong code goes back to the code step', (tester) async {
    await openApp(tester, '/login?forgot=1');
    await tester.enterText(find.byType(TextField), '01712345678');
    await tester.tap(find.text('Send OTP'));
    await settle(tester);
    await tester.enterText(find.byType(TextField), '111111');
    await tester.tap(find.text('Verify OTP').last);
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'newpass1');
    await tester.tap(find.text('Reset password'));
    await settle(tester);
    expect(find.text('Wrong code. Try again.'), findsOneWidget);
    expect(find.text('Demo code: 123456'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '123456');
    await tester.tap(find.text('Verify OTP').last);
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'newpass1');
    await tester.tap(find.text('Reset password'));
    await settle(tester);
    expect(find.text('Password reset. You can now log in.'), findsOneWidget);
  });
}

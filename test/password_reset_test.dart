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
}

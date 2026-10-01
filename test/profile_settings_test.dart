import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/app_harness.dart';

void main() {
  testWidgets('profile opens saved address pickers', (tester) async {
    await openApp(tester, '/profile', role: 'reader');

    final addresses = find.text('Saved addresses');
    await tester.ensureVisible(addresses);
    await tester.tap(addresses);
    await tester.pumpAndSettle();

    expect(find.text('Saved addresses'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();
    expect(find.text('Division'), findsOneWidget);
    expect(find.text('District'), findsOneWidget);
    expect(find.text('Upazila'), findsOneWidget);
  });

  testWidgets('profile opens notification and privacy settings', (
    tester,
  ) async {
    await openApp(tester, '/profile', role: 'reader');

    final notifications = find.text('Notifications');
    await tester.ensureVisible(notifications);
    await tester.tap(notifications);
    await tester.pumpAndSettle();

    expect(find.text('Push notifications'), findsOneWidget);
    expect(find.text('Profile visibility'), findsOneWidget);
    expect(find.text('Delete account'), findsOneWidget);
  });

  testWidgets('saved addresses offer edit and delete actions', (tester) async {
    await openApp(tester, '/profile', role: 'reader');
    final addresses = find.text('Saved addresses');
    await tester.ensureVisible(addresses);
    await tester.tap(addresses);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    expect(find.text('Edit address'), findsOneWidget);
    expect(find.text('Delete address'), findsOneWidget);

    await tester.tap(find.text('Edit address'));
    await tester.pumpAndSettle();
    expect(find.text('Save address'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete address'));
    await tester.pumpAndSettle();
    expect(find.text('Remove this saved address?'), findsOneWidget);
  });
}

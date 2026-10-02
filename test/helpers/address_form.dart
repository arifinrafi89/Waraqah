import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/widgets/app_text_field.dart';

/// Fills the open address editor as "Office" in Gazipur › Kaliakair.
Future<void> fillOfficeAddress(WidgetTester tester) async {
  Future<void> type(String label, String text) async {
    final field = find.descendant(
      of: find.widgetWithText(AppTextField, label),
      matching: find.byType(TextField),
    );
    await tester.ensureVisible(field);
    await tester.enterText(field, text);
  }

  Future<void> pick(String label, String item) async {
    final dropdown = find.widgetWithText(
      DropdownButtonFormField<String>,
      label,
    );
    await tester.ensureVisible(dropdown);
    await tester.tap(dropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.text(item).last);
    await tester.pumpAndSettle();
  }

  await type('Address label', 'Office');
  await type('Phone number', '01812345678');
  await type('House, road and area', 'Level 4, BSCIC Road');
  await pick('Division', 'Dhaka');
  await pick('District', 'Gazipur');
  await pick('Upazila', 'Kaliakair');
}

/// Taps the editor's Save address, scrolling to it first.
Future<void> saveAddress(WidgetTester tester) async {
  final save = find.text('Save address');
  // The pickers load first and push the button down.
  await tester.pump(const Duration(seconds: 1));
  await tester.ensureVisible(save);
  await tester.pump();
  await tester.tap(save);
  for (var i = 0; i < 4; i++) {
    await tester.pump(const Duration(milliseconds: 500));
  }
}

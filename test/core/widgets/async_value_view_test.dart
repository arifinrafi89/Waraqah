import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/core/widgets/async_value_view.dart';

Widget _buildView(AsyncValue<int> value) {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: Scaffold(
      body: AsyncValueView<int>(
        value: value,
        data: (v) => Text('$v'),
      ),
    ),
  );
}

void main() {
  testWidgets('renders the data builder when the value has data', (
    tester,
  ) async {
    await tester.pumpWidget(_buildView(const AsyncValue.data(42)));

    expect(find.text('42'), findsOneWidget);
  });

  testWidgets('renders a spinner while loading', (tester) async {
    await tester.pumpWidget(_buildView(const AsyncValue.loading()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders the error message on error, not the data builder', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildView(AsyncValue.error(Exception('x'), StackTrace.empty)),
    );

    expect(find.text("Couldn't load this right now."), findsOneWidget);
    expect(find.text('42'), findsNothing);
  });
}

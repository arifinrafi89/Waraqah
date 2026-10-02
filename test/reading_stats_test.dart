import 'package:flutter_test/flutter_test.dart';

import 'helpers/app_harness.dart';

void main() {
  testWidgets('reading stats show goal, streak, months and categories', (
    tester,
  ) async {
    await openApp(tester, '/reading-stats', role: 'reader');

    expect(find.text('Reading stats'), findsOneWidget);
    expect(find.text('Yearly reading goal'), findsOneWidget);
    expect(find.text('Reading streak'), findsOneWidget);
    expect(find.text('Books per month'), findsOneWidget);
    expect(find.text('Favorite categories'), findsOneWidget);
    expect(find.text('Non-fiction'), findsOneWidget);
  });
}

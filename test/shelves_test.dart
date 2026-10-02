import 'package:flutter_test/flutter_test.dart';

import 'helpers/app_harness.dart';

void main() {
  testWidgets('shelves show three states and add delivered books to Reading', (
    tester,
  ) async {
    await openApp(tester, '/shelves', role: 'reader');
    await settle(tester);

    expect(find.text('My shelves'), findsOneWidget);
    expect(find.text('Want to read'), findsOneWidget);
    expect(find.text('Reading'), findsOneWidget);
    expect(find.text('Finished'), findsOneWidget);

    await tester.tap(find.text('Reading'));
    await tester.pump();
    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);
    expect(find.text('Added after delivery'), findsOneWidget);
  });
}

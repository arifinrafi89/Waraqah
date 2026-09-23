import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/main.dart';

void main() {
  testWidgets('WaraqahApp smoke test renders navigation shell', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: WaraqahApp()));
    await tester.pumpAndSettle();

    // Verify shell navigation destinations exist
    expect(find.text('Marketplace'), findsWidgets);
    expect(find.text('P2P Resale'), findsWidgets);
    expect(find.text('Messages'), findsWidgets);
    expect(find.text('Profile'), findsWidgets);
  });
}

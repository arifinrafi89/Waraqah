import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/app/app.dart';
import 'package:waraqah/features/auth/presentation/providers/auth_providers.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a section the role cannot open sends staff to the hub', (
    tester,
  ) async {
    final moderator = await openApp(tester, '/admin/orders', role: 'moderator');
    expect(pathOf(moderator), '/admin');
    expect(find.text('Orders'), findsNothing);

    final support = await openApp(tester, '/admin/catalog', role: 'support');
    expect(pathOf(support), '/admin');
  });

  testWidgets('staff open the sections their role allows', (tester) async {
    final catalog = await openApp(
      tester,
      '/admin/catalog',
      role: 'catalogManager',
    );
    expect(pathOf(catalog), '/admin/catalog');
    expect(find.text('Categories'), findsOneWidget);

    final dashboard = await openApp(
      tester,
      '/admin/dashboard',
      role: 'support',
    );
    expect(pathOf(dashboard), '/admin/dashboard');
    expect(find.text('Coming soon'), findsOneWidget);
  });

  testWidgets('readers go home and guests go to login', (tester) async {
    final reader = await openApp(tester, '/admin/catalog', role: 'reader');
    expect(pathOf(reader), '/home');

    final guest = await openApp(tester, '/admin');
    expect(pathOf(guest), '/login');
  });

  testWidgets('signing out inside the admin area leaves it', (tester) async {
    final router = await openApp(tester, '/admin', role: 'superAdmin');
    final container = ProviderScope.containerOf(
      tester.element(find.byType(WaraqahApp)),
    );
    await container.read(sessionProvider.notifier).signOut();
    await settle(tester);
    expect(pathOf(router), '/login');
  });
}

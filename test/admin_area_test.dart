import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/app_harness.dart';

const _tiles = ['Dashboard', 'Catalog', 'Orders', 'Moderation'];

void _expectTiles(List<String> shown) {
  for (final tile in _tiles) {
    expect(
      find.text(tile),
      shown.contains(tile) ? findsOneWidget : findsNothing,
      reason: tile,
    );
  }
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('super admin sees every section and moves around', (
    tester,
  ) async {
    final router = await openApp(tester, '/admin', role: 'superAdmin');
    expect(find.text('Admin area'), findsOneWidget);
    _expectTiles(_tiles);

    await tester.tap(find.text('Moderation'));
    await settle(tester);
    expect(pathOf(router), '/admin/moderation');
    expect(find.text('Moderation Center'), findsOneWidget);
    expect(find.text('Listings to approve'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await settle(tester);
    expect(pathOf(router), '/admin');
    _expectTiles(_tiles);

    await tester.tap(find.byTooltip('Close'));
    await settle(tester);
    expect(pathOf(router), '/profile');
  });

  testWidgets('moderator sees only their sections', (tester) async {
    await openApp(tester, '/admin', role: 'moderator');
    expect(find.text('Moderator'), findsOneWidget);
    _expectTiles(['Dashboard', 'Moderation']);
  });

  testWidgets('staff reach the admin area from profile and back', (
    tester,
  ) async {
    final router = await openApp(tester, '/profile', role: 'moderator');
    await tester.tap(find.text('Admin area'));
    await settle(tester);
    _expectTiles(['Dashboard', 'Moderation']);

    await tester.tap(find.text('Dashboard'));
    await settle(tester);
    await tester.tap(find.byTooltip('Back'));
    await settle(tester);
    await tester.tap(find.byTooltip('Close'));
    await settle(tester);
    expect(pathOf(router), '/profile');
  });

  testWidgets('readers and guests get no admin area button', (tester) async {
    for (final role in ['reader', null]) {
      await openApp(tester, '/profile', role: role);
      expect(find.text('Admin area'), findsNothing, reason: '$role');
    }
  });
}

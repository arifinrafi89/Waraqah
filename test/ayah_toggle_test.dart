import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/features/home/presentation/widgets/ayah_card.dart';
import 'package:waraqah/features/profile/profile_routes.dart';

import 'helpers/app_harness.dart';

const _hidden = 'Hidden. Turn it back on in Profile.';

/// Scrolls the Ayah card to mid-screen, then taps its ✕.
Future<void> _hide(WidgetTester tester) async {
  await tester.drag(find.byType(CustomScrollView), const Offset(0, -250));
  await settle(tester);
  await tester.tap(find.byTooltip('Hide Ayah of the Day'));
  await tester.pump();
}

/// Everything the app has saved on the device so far.
Future<Map<String, Object>> _saved() async {
  final prefs = await SharedPreferences.getInstance();
  return {for (final k in prefs.getKeys()) k: prefs.get(k)!};
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Ayah of the Day shows by default; ✕ hides it, Undo brings it '
      'back', (tester) async {
    await openApp(tester, HomeRoutes.home);
    expect(find.byType(AyahCard), findsOneWidget);

    await _hide(tester);
    expect(find.byType(AyahCard), findsNothing);
    expect(find.text(_hidden), findsOneWidget);

    await settle(tester);
    await tester.tap(find.text('Undo'));
    await settle(tester);
    expect(find.byType(AyahCard), findsOneWidget);
  });

  testWidgets('hidden stays hidden after reopening the app', (tester) async {
    await openApp(tester, HomeRoutes.home);
    await _hide(tester);
    final saved = await _saved();

    await openApp(tester, HomeRoutes.home, prefs: saved);
    expect(find.byType(AyahCard), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the Profile switch turns it on and off', (tester) async {
    await openApp(tester, HomeRoutes.home);
    await _hide(tester);
    final router = await openApp(
      tester,
      ProfileRoutes.profile,
      prefs: await _saved(),
    );

    final tile = find.widgetWithText(SwitchListTile, 'Show Ayah of the Day');
    await tester.scrollUntilVisible(tile, 200);
    expect(tester.widget<SwitchListTile>(tile).value, isFalse);
    await tester.tap(tile);
    await tester.pump();
    expect(tester.widget<SwitchListTile>(tile).value, isTrue);

    router.go(HomeRoutes.home);
    await settle(tester);
    expect(find.byType(AyahCard), findsOneWidget);

    router.go(ProfileRoutes.profile);
    await settle(tester);
    await tester.tap(tile);
    router.go(HomeRoutes.home);
    await settle(tester);
    expect(find.byType(AyahCard), findsNothing);
  });
}

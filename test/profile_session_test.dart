import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waraqah/core/settings/settings_provider.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/profile/presentation/pages/profile_page.dart';
import 'package:waraqah/l10n/app_localizations.dart';

/// Renders the Profile tab at phone size with [saved] as the stored session.
Future<void> _pumpProfile(WidgetTester tester, {Object? saved}) async {
  tester.view.physicalSize = const Size(375, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  SharedPreferences.setMockInitialValues({
    if (saved != null) 'waraqah.session': jsonEncode(saved),
  });
  final prefs = await SharedPreferences.getInstance();

  await tester.pumpWidget(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: MaterialApp(
        theme: AppTheme.light(),
        supportedLocales: AppL10n.supportedLocales,
        localizationsDelegates: AppL10n.localizationsDelegates,
        home: const Scaffold(body: ProfilePage()),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('shows a signed-in staff account with log out', (tester) async {
    await _pumpProfile(
      tester,
      saved: {
        'id': 'user-admin@waraqah.test',
        'name': 'Waraqah Admin',
        'email': 'admin@waraqah.test',
        'role': 'superAdmin',
      },
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Waraqah Admin'), findsOneWidget);
    expect(find.text('admin@waraqah.test'), findsOneWidget);
    expect(find.text('Admin'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets('shows a guest with a log in button', (tester) async {
    await _pumpProfile(tester);

    expect(tester.takeException(), isNull);
    expect(find.text('Guest'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);
    expect(find.text('Log out'), findsNothing);
  });
}

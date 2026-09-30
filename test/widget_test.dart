import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

import 'package:waraqah/core/settings/settings_provider.dart';
import 'package:waraqah/core/theme/app_palette.dart';
import 'package:waraqah/core/utils/formatters.dart';

void main() {
  group('Bdt.format', () {
    test('adds the taka symbol', () {
      expect(Bdt.format(650), '৳650');
    });

    test('groups thousands', () {
      expect(Bdt.format(12500), '৳12,500');
      expect(Bdt.format(1204), '৳1,204');
    });
  });

  group('AppPalette', () {
    test('light and dark expose the same number of chip colours', () {
      expect(AppPalette.light.chips.length, AppPalette.dark.chips.length);
    });

    test('chipFor wraps around and is stable for a seed', () {
      final palette = AppPalette.dark;
      expect(palette.chipFor(0), palette.chips[0]);
      expect(palette.chipFor(4), palette.chips[0]);
      expect(palette.chipFor(7), palette.chipFor(7));
    });

    test('is registered as a theme extension on both themes', () {
      for (final palette in [AppPalette.light, AppPalette.dark]) {
        final theme = ThemeData(extensions: [palette]);
        expect(theme.extension<AppPalette>(), palette);
      }
    });
  });

  group('settingsProvider', () {
    Future<SharedPreferences> mockPrefs() async {
      SharedPreferencesStorePlatform.instance =
          InMemorySharedPreferencesStore.empty();
      return SharedPreferences.getInstance();
    }

    test(
      'changes theme mode and locale, and a fresh container reads them back',
      () async {
        final prefs = await mockPrefs();
        final container = ProviderContainer(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        );
        addTearDown(container.dispose);

        await container
            .read(settingsProvider.notifier)
            .setThemeMode(ThemeMode.dark);
        await container
            .read(settingsProvider.notifier)
            .setLocale(const Locale('bn'));

        expect(container.read(settingsProvider).themeMode, ThemeMode.dark);
        expect(container.read(settingsProvider).locale, const Locale('bn'));

        SharedPreferences.resetStatic();
        final freshPrefs = await SharedPreferences.getInstance();
        final freshContainer = ProviderContainer(
          overrides: [sharedPreferencesProvider.overrideWithValue(freshPrefs)],
        );
        addTearDown(freshContainer.dispose);

        expect(freshContainer.read(settingsProvider).themeMode, ThemeMode.dark);
        expect(
          freshContainer.read(settingsProvider).locale,
          const Locale('bn'),
        );
      },
    );
  });
}

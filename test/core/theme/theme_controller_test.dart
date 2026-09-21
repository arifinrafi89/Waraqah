import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waraqah/core/theme/theme_controller.dart';
import 'package:waraqah/core/theme/theme_family.dart';

void main() {
  test('defaults to Forest (dark) on first launch', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final state = container.read(themeControllerProvider);

    expect(state.mode, ThemeMode.dark);
    expect(state.activeFamily, ThemeFamily.forest);
  });

  test('setMode and setFamily persist and read back via shared_preferences', () async {
    SharedPreferences.setMockInitialValues({});
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container.read(themeControllerProvider.notifier).setMode(ThemeMode.light);
    await container
        .read(themeControllerProvider.notifier)
        .setFamily(ThemeFamily.tokyoDay);

    final prefs = await SharedPreferences.getInstance();
    final persisted = readPersistedThemeState(prefs);

    expect(persisted.mode, ThemeMode.light);
    expect(persisted.lightFamily, ThemeFamily.tokyoDay);
    expect(persisted.activeFamily, ThemeFamily.tokyoDay);
  });
}

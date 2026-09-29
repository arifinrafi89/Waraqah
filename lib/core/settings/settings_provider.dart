import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings_store.dart';

/// Overridden in `ProviderScope` by [AppBootstrap] once `SharedPreferences`
/// has opened. Throwing on the default keeps a missing override loud.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider not overridden'),
);

final _settingsStoreProvider = Provider<SettingsStore>(
  (ref) => SettingsStore(ref.watch(sharedPreferencesProvider)),
);

/// App-wide appearance and language state.
class AppSettings {
  const AppSettings({required this.themeMode, required this.locale});

  final ThemeMode themeMode;

  /// `null` = follow the device locale.
  final Locale? locale;

  AppSettings copyWith({ThemeMode? themeMode, Locale? locale}) => AppSettings(
    themeMode: themeMode ?? this.themeMode,
    locale: locale ?? this.locale,
  );
}

/// App-wide theme mode and locale, persisted through [SettingsStore].
/// `WaraqahApp` watches this to rebuild `MaterialApp`, and the Profile and
/// home app bar toggles write to it.
class SettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    final store = ref.watch(_settingsStoreProvider);
    return AppSettings(
      themeMode: store.readThemeMode(),
      locale: store.readLocale(),
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == state.themeMode) return;
    state = state.copyWith(themeMode: mode);
    await ref.read(_settingsStoreProvider).writeThemeMode(mode);
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale?.languageCode == state.locale?.languageCode) return;
    state = AppSettings(themeMode: state.themeMode, locale: locale);
    await ref.read(_settingsStoreProvider).writeLocale(locale);
  }

  /// Convenience for the quick toggle in the app bar.
  Future<void> toggleBrightness(Brightness current) => setThemeMode(
    current == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
  );
}

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  SettingsNotifier.new,
);

import 'package:flutter/material.dart';

import 'settings_store.dart';

/// App-wide appearance and language state, exposed through the `provider`
/// package because it is classic cross-cutting `ChangeNotifier` territory:
/// `WaraqahApp` watches it to rebuild `MaterialApp`, and the Profile screen
/// writes to it. Feature-level data stays on Riverpod.
class SettingsController extends ChangeNotifier {
  SettingsController(this._store)
    : _themeMode = _store.readThemeMode(),
      _locale = _store.readLocale();

  final SettingsStore _store;

  ThemeMode _themeMode;
  Locale? _locale;

  ThemeMode get themeMode => _themeMode;

  /// `null` = follow the device locale.
  Locale? get locale => _locale;

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
    await _store.writeThemeMode(mode);
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale?.languageCode == _locale?.languageCode) return;
    _locale = locale;
    notifyListeners();
    await _store.writeLocale(locale);
  }

  /// Convenience for the quick toggle in the app bar.
  Future<void> toggleBrightness(Brightness current) => setThemeMode(
    current == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
  );
}

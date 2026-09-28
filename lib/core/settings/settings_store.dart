import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the two user preferences that must survive a restart.
///
/// Kept deliberately thin: it knows about `SharedPreferences` keys and nothing
/// about widgets, so [SettingsController] stays testable with a fake store.
class SettingsStore {
  SettingsStore(this._prefs);

  static const _themeKey = 'waraqah.themeMode';
  static const _localeKey = 'waraqah.localeCode';

  final SharedPreferences _prefs;

  static Future<SettingsStore> open() async =>
      SettingsStore(await SharedPreferences.getInstance());

  ThemeMode readThemeMode() {
    final raw = _prefs.getString(_themeKey);
    return ThemeMode.values.firstWhere(
      (m) => m.name == raw,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> writeThemeMode(ThemeMode mode) =>
      _prefs.setString(_themeKey, mode.name);

  /// `null` means "follow the device language".
  Locale? readLocale() {
    final code = _prefs.getString(_localeKey);
    return code == null ? null : Locale(code);
  }

  Future<void> writeLocale(Locale? locale) => locale == null
      ? _prefs.remove(_localeKey)
      : _prefs.setString(_localeKey, locale.languageCode);
}

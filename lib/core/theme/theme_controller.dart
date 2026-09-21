import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_family.dart';

const _modeKey = 'waraqah.theme.mode';
const _darkFamilyKey = 'waraqah.theme.darkFamily';
const _lightFamilyKey = 'waraqah.theme.lightFamily';

@immutable
class AppThemeState {
  const AppThemeState({
    required this.mode,
    required this.darkFamily,
    required this.lightFamily,
  });

  static const defaultState = AppThemeState(
    mode: ThemeMode.dark,
    darkFamily: ThemeFamily.forest,
    lightFamily: ThemeFamily.nord,
  );

  final ThemeMode mode;
  final ThemeFamily darkFamily;
  final ThemeFamily lightFamily;

  /// The family that should actually render, given the current mode.
  ThemeFamily get activeFamily =>
      mode == ThemeMode.dark ? darkFamily : lightFamily;

  AppThemeState copyWith({
    ThemeMode? mode,
    ThemeFamily? darkFamily,
    ThemeFamily? lightFamily,
  }) {
    return AppThemeState(
      mode: mode ?? this.mode,
      darkFamily: darkFamily ?? this.darkFamily,
      lightFamily: lightFamily ?? this.lightFamily,
    );
  }
}

/// Reads persisted theme selection, falling back to [AppThemeState.defaultState]
/// (Forest, dark) for anything missing or unrecognized.
AppThemeState readPersistedThemeState(SharedPreferences prefs) {
  final mode = _enumByName(ThemeMode.values, prefs.getString(_modeKey)) ??
      AppThemeState.defaultState.mode;
  final darkFamily =
      _enumByName(ThemeFamily.values, prefs.getString(_darkFamilyKey)) ??
          AppThemeState.defaultState.darkFamily;
  final lightFamily =
      _enumByName(ThemeFamily.values, prefs.getString(_lightFamilyKey)) ??
          AppThemeState.defaultState.lightFamily;
  return AppThemeState(
    mode: mode,
    darkFamily: darkFamily,
    lightFamily: lightFamily,
  );
}

T? _enumByName<T extends Enum>(List<T> values, String? name) {
  if (name == null) return null;
  for (final value in values) {
    if (value.name == name) return value;
  }
  return null;
}

class ThemeController extends Notifier<AppThemeState> {
  ThemeController([this._initial]);

  final AppThemeState? _initial;

  @override
  AppThemeState build() => _initial ?? AppThemeState.defaultState;

  Future<void> setMode(ThemeMode mode) async {
    state = state.copyWith(mode: mode);
    await _persist();
  }

  /// Sets the family for the current mode (dark family if mode is dark,
  /// light family otherwise).
  Future<void> setFamily(ThemeFamily family) async {
    state = state.mode == ThemeMode.dark
        ? state.copyWith(darkFamily: family)
        : state.copyWith(lightFamily: family);
    await _persist();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_modeKey, state.mode.name);
    await prefs.setString(_darkFamilyKey, state.darkFamily.name);
    await prefs.setString(_lightFamilyKey, state.lightFamily.name);
  }
}

final themeControllerProvider =
    NotifierProvider<ThemeController, AppThemeState>(ThemeController.new);

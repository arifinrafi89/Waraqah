import 'package:flutter/material.dart';

/// One of the 6 design-brief color themes.
enum ThemeFamily {
  forest,
  nord,
  tokyoNight,
  tokyoDay,
  catppuccinMocha,
  catppuccinLatte;

  Brightness get brightness {
    switch (this) {
      case ThemeFamily.forest:
      case ThemeFamily.tokyoNight:
      case ThemeFamily.catppuccinMocha:
        return Brightness.dark;
      case ThemeFamily.nord:
      case ThemeFamily.tokyoDay:
      case ThemeFamily.catppuccinLatte:
        return Brightness.light;
    }
  }

  /// The 3 families offered for [mode] (dark: Forest/Tokyo Night/Mocha,
  /// light: Nord/Tokyo Day/Latte), in the brief's listed order.
  static List<ThemeFamily> familiesFor(ThemeMode mode) {
    final brightness = mode == ThemeMode.dark ? Brightness.dark : Brightness.light;
    return values.where((family) => family.brightness == brightness).toList();
  }
}

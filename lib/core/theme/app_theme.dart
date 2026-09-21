import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_palette.dart';
import 'theme_family.dart';

class AppTheme {
  /// Amiri 400, RTL, ~23px, line-height 1.9 — Daily Ayah card only.
  static TextStyle ayahTextStyle(AppPalette palette) {
    return GoogleFonts.amiri(
      color: palette.text,
      fontSize: 23,
      height: 1.9,
    );
  }

  /// Reem Kufi 500 — wordmark and P2P cover title text only.
  static TextStyle wordmarkTextStyle(AppPalette palette) {
    return GoogleFonts.reemKufi(
      color: palette.text,
      fontWeight: FontWeight.w500,
    );
  }

  static ThemeData themeFor(ThemeFamily family) {
    final palette = AppPalette.forFamily(family);
    final brightness = family.brightness;

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: palette.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette.accent,
        brightness: brightness,
        primary: palette.accent,
        onPrimary: palette.accentInk,
        surface: palette.surface,
        onSurface: palette.text,
      ),
      extensions: [palette],
    );

    return base.copyWith(
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme).apply(
        bodyColor: palette.text,
        displayColor: palette.text,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: wordmarkTextStyle(palette).copyWith(fontSize: 22),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: palette.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: palette.border),
        ),
      ),
      // Cupertino's slide+fade reads smoother than Android's default
      // FadeUpwards on pushed routes (login, cart, search, ai-chat).
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static ThemeData get lightTheme => themeFor(ThemeFamily.nord);

  static ThemeData get darkTheme => themeFor(ThemeFamily.forest);
}

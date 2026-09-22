import 'package:flutter/material.dart';

import 'app_dimens.dart';
import 'app_palette.dart';
import 'app_typography.dart';

/// Builds the light and dark [ThemeData] from a single [AppPalette].
abstract final class AppTheme {
  static ThemeData light() => _build(AppPalette.light, Brightness.light);
  static ThemeData dark() => _build(AppPalette.dark, Brightness.dark);

  static ThemeData _build(AppPalette p, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: p.accent,
      brightness: brightness,
      primary: p.accent,
      onPrimary: p.accentInk,
      surface: p.surface,
      onSurface: p.text,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: p.bg,
      canvasColor: p.bg,
      dividerColor: p.border,
      extensions: [p],
      textTheme: _text(p),
      appBarTheme: AppBarTheme(
        backgroundColor: p.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.card),
          side: BorderSide(color: p.border),
        ),
      ),
      splashFactory: InkSparkle.splashFactory,
      highlightColor: p.accent.withValues(alpha: 0.06),
    );
  }

  static TextTheme _text(AppPalette p) => TextTheme(
    titleLarge: AppFonts.ui(size: 17, weight: FontWeight.w800, color: p.text),
    titleMedium: AppFonts.ui(size: 15, weight: FontWeight.w800, color: p.text),
    titleSmall: AppFonts.ui(size: 13, weight: FontWeight.w800, color: p.text),
    bodyMedium: AppFonts.ui(size: 13, height: 1.5, color: p.textDim),
    bodySmall: AppFonts.ui(size: 12, height: 1.45, color: p.textDim),
    labelLarge: AppFonts.ui(size: 14, weight: FontWeight.w800, color: p.text),
    labelMedium: AppFonts.ui(size: 11.5, weight: FontWeight.w700, color: p.textDim),
    labelSmall: AppFonts.ui(size: 10.5, weight: FontWeight.w700, color: p.textFaint),
  );
}

/// Shorthand so widgets can write `context.palette.accent`.
extension PaletteX on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
  TextTheme get texts => Theme.of(this).textTheme;
}

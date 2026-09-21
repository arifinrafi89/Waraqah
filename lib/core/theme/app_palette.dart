import 'package:flutter/material.dart';

import 'theme_family.dart';

/// Design-brief color tokens for one theme family, as a [ThemeExtension] so
/// every screen reads colors from `Theme.of(context).extension<AppPalette>()`
/// instead of hardcoding one-off widget colors.
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.border,
    required this.text,
    required this.textDim,
    required this.textFaint,
    required this.accent,
    required this.accentInk,
    required this.accentSoft,
    required this.chip1,
    required this.chip2,
    required this.chip3,
    required this.chip4,
  });

  final Color bg;
  final Color surface;
  final Color surface2;
  final Color border;
  final Color text;
  final Color textDim;
  final Color textFaint;
  final Color accent;
  final Color accentInk;
  final Color accentSoft;
  final Color chip1;
  final Color chip2;
  final Color chip3;
  final Color chip4;

  /// chip1-4, in rotation order, for placeholder book/P2P cover gradients.
  List<Color> get chips => [chip1, chip2, chip3, chip4];

  static const forest = AppPalette(
    bg: Color(0xFF12160F),
    surface: Color(0xFF1A2016),
    surface2: Color(0xFF222B1C),
    border: Color(0xFF2B3524),
    text: Color(0xFFE9F1E2),
    textDim: Color(0xFFA3B596),
    textFaint: Color(0xFF6F8262),
    accent: Color(0xFF3FB464),
    accentInk: Color(0xFF06170C),
    accentSoft: Color(0xFF213826),
    chip1: Color(0xFF3FB464),
    chip2: Color(0xFF8BC6A0),
    chip3: Color(0xFFD9C26A),
    chip4: Color(0xFF6FA8DC),
  );

  static const nord = AppPalette(
    bg: Color(0xFFECEFF4),
    surface: Color(0xFFFFFFFF),
    surface2: Color(0xFFE5E9F0),
    border: Color(0xFFD8DEE9),
    text: Color(0xFF2E3440),
    textDim: Color(0xFF4C566A),
    textFaint: Color(0xFF7A8496),
    accent: Color(0xFF5E81AC),
    accentInk: Color(0xFFFFFFFF),
    accentSoft: Color(0xFFDCE4EE),
    chip1: Color(0xFF5E81AC),
    chip2: Color(0xFF88C0D0),
    chip3: Color(0xFFD08770),
    chip4: Color(0xFFA3BE8C),
  );

  static const tokyoNight = AppPalette(
    bg: Color(0xFF1A1B26),
    surface: Color(0xFF20222F),
    surface2: Color(0xFF292C3D),
    border: Color(0xFF343850),
    text: Color(0xFFC0CAF5),
    textDim: Color(0xFF9099C4),
    textFaint: Color(0xFF565F89),
    accent: Color(0xFF7AA2F7),
    accentInk: Color(0xFF0F1220),
    accentSoft: Color(0xFF2A3352),
    chip1: Color(0xFF7AA2F7),
    chip2: Color(0xFFBB9AF7),
    chip3: Color(0xFFE0AF68),
    chip4: Color(0xFF9ECE6A),
  );

  static const tokyoDay = AppPalette(
    bg: Color(0xFFE1E2E7),
    surface: Color(0xFFF4F4F8),
    surface2: Color(0xFFD5D6DB),
    border: Color(0xFFC8C9D1),
    text: Color(0xFF343B58),
    textDim: Color(0xFF565A6E),
    textFaint: Color(0xFF767A8C),
    accent: Color(0xFF2959AA),
    accentInk: Color(0xFFFFFFFF),
    accentSoft: Color(0xFFC8D4EE),
    chip1: Color(0xFF2959AA),
    chip2: Color(0xFF7550AA),
    chip3: Color(0xFF8C6C3E),
    chip4: Color(0xFF587539),
  );

  static const catppuccinMocha = AppPalette(
    bg: Color(0xFF1E1E2E),
    surface: Color(0xFF252537),
    surface2: Color(0xFF313244),
    border: Color(0xFF3D3E54),
    text: Color(0xFFCDD6F4),
    textDim: Color(0xFFA6ADC8),
    textFaint: Color(0xFF6C7086),
    accent: Color(0xFFCBA6F7),
    accentInk: Color(0xFF1A1523),
    accentSoft: Color(0xFF392F4A),
    chip1: Color(0xFFCBA6F7),
    chip2: Color(0xFFF5C2E7),
    chip3: Color(0xFFF9E2AF),
    chip4: Color(0xFF94E2D5),
  );

  static const catppuccinLatte = AppPalette(
    bg: Color(0xFFEFF1F5),
    surface: Color(0xFFFFFFFF),
    surface2: Color(0xFFE6E9EF),
    border: Color(0xFFDBDFF0),
    text: Color(0xFF4C4F69),
    textDim: Color(0xFF6C6F85),
    textFaint: Color(0xFF8C8FA1),
    accent: Color(0xFF8839EF),
    accentInk: Color(0xFFFFFFFF),
    accentSoft: Color(0xFFE9DCFB),
    chip1: Color(0xFF8839EF),
    chip2: Color(0xFFEA76CB),
    chip3: Color(0xFFDF8E1D),
    chip4: Color(0xFF40A02B),
  );

  static AppPalette forFamily(ThemeFamily family) {
    switch (family) {
      case ThemeFamily.forest:
        return forest;
      case ThemeFamily.nord:
        return nord;
      case ThemeFamily.tokyoNight:
        return tokyoNight;
      case ThemeFamily.tokyoDay:
        return tokyoDay;
      case ThemeFamily.catppuccinMocha:
        return catppuccinMocha;
      case ThemeFamily.catppuccinLatte:
        return catppuccinLatte;
    }
  }

  @override
  AppPalette copyWith({
    Color? bg,
    Color? surface,
    Color? surface2,
    Color? border,
    Color? text,
    Color? textDim,
    Color? textFaint,
    Color? accent,
    Color? accentInk,
    Color? accentSoft,
    Color? chip1,
    Color? chip2,
    Color? chip3,
    Color? chip4,
  }) {
    return AppPalette(
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surface2: surface2 ?? this.surface2,
      border: border ?? this.border,
      text: text ?? this.text,
      textDim: textDim ?? this.textDim,
      textFaint: textFaint ?? this.textFaint,
      accent: accent ?? this.accent,
      accentInk: accentInk ?? this.accentInk,
      accentSoft: accentSoft ?? this.accentSoft,
      chip1: chip1 ?? this.chip1,
      chip2: chip2 ?? this.chip2,
      chip3: chip3 ?? this.chip3,
      chip4: chip4 ?? this.chip4,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      textDim: Color.lerp(textDim, other.textDim, t)!,
      textFaint: Color.lerp(textFaint, other.textFaint, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentInk: Color.lerp(accentInk, other.accentInk, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      chip1: Color.lerp(chip1, other.chip1, t)!,
      chip2: Color.lerp(chip2, other.chip2, t)!,
      chip3: Color.lerp(chip3, other.chip3, t)!,
      chip4: Color.lerp(chip4, other.chip4, t)!,
    );
  }
}

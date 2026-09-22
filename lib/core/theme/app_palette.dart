import 'package:flutter/material.dart';

/// Design tokens for a single Waraqah colour scheme.
///
/// The values mirror the Penpot/HTML theme board one-for-one, so the Flutter UI
/// and the design source never drift apart. Read them from any widget with
/// `Theme.of(context).extension<AppPalette>()!` or the `context.palette` getter
/// in `app_theme.dart`.
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
    required this.chips,
    required this.scrim,
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
  final List<Color> chips;
  final Color scrim;

  /// `forest` — the dark Waraqah identity.
  static const dark = AppPalette(
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
    chips: [
      Color(0xFF3FB464),
      Color(0xFF8BC6A0),
      Color(0xFFD9C26A),
      Color(0xFF6FA8DC),
    ],
    scrim: Color(0xB80A0E08),
  );

  /// `forest-light` — same hue family, tuned for daylight.
  static const light = AppPalette(
    bg: Color(0xFFEEF0EC),
    surface: Color(0xFFFFFFFF),
    surface2: Color(0xFFE2E5DE),
    border: Color(0xFFCFD4C8),
    text: Color(0xFF20241F),
    textDim: Color(0xFF4E5648),
    textFaint: Color(0xFF7A8274),
    accent: Color(0xFF2B6B45),
    accentInk: Color(0xFFFFFFFF),
    accentSoft: Color(0xFFDCEDE2),
    chips: [
      Color(0xFF2B6B45),
      Color(0xFF4E8C69),
      Color(0xFF8C6C3E),
      Color(0xFF3E6EA0),
    ],
    scrim: Color(0x9E141E12),
  );

  /// Stable per-item accent so a book keeps the same cover colour every build.
  Color chipFor(int seed) => chips[seed.abs() % chips.length];

  @override
  AppPalette copyWith({Color? accent, Color? bg}) => AppPalette(
    bg: bg ?? this.bg,
    surface: surface,
    surface2: surface2,
    border: border,
    text: text,
    textDim: textDim,
    textFaint: textFaint,
    accent: accent ?? this.accent,
    accentInk: accentInk,
    accentSoft: accentSoft,
    chips: chips,
    scrim: scrim,
  );

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return t < 0.5 ? this : other;
  }
}

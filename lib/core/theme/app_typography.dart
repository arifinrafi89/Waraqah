import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The three type families the design board uses.
///
/// `Manrope` carries the whole UI, `Reem Kufi` is reserved for the wordmark and
/// cover art, and `Amiri` renders Qur'anic Arabic. Google Fonts falls back to a
/// system face if the font cannot be fetched, so the UI never breaks.
abstract final class AppFonts {
  static TextStyle ui({
    required double size,
    FontWeight weight = FontWeight.w600,
    Color? color,
    double? height,
    double letterSpacing = 0,
    FontStyle? style,
    TextDecoration? decoration,
  }) => GoogleFonts.manrope(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
    fontStyle: style,
    decoration: decoration,
  );

  static TextStyle display({required double size, Color? color}) =>
      GoogleFonts.reemKufi(fontSize: size, fontWeight: FontWeight.w500, color: color);

  static TextStyle arabic({required double size, Color? color}) =>
      GoogleFonts.amiri(fontSize: size, height: 1.9, color: color);

  /// Prices and counters line up in columns when digits are tabular.
  static TextStyle numeric({
    required double size,
    FontWeight weight = FontWeight.w800,
    Color? color,
    TextDecoration? decoration,
  }) => GoogleFonts.manrope(
    fontSize: size,
    fontWeight: weight,
    color: color,
    decoration: decoration,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}

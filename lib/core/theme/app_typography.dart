import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography definitions following design guidelines.
abstract class AppTypography {
  static TextStyle get brandTitle => GoogleFonts.philosopher(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle get h1 => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static TextStyle get h2 => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle get h3 => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get bodySmall => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle get label => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  static TextTheme textTheme(bool isDark) {
    final defaultColor = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    return GoogleFonts.poppinsTextTheme().apply(
      bodyColor: defaultColor,
      displayColor: defaultColor,
    );
  }
}

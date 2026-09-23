import 'package:flutter/material.dart';

/// Semantic design tokens for Waraqah, following open_ui_kit / shadcn conventions.
abstract class AppColors {
  // Brand Palette (Emerald & Amber)
  static const Color primary = Color(0xFF064E3B); // Deep Emerald
  static const Color primaryLight = Color(0xFF10B981); // Bright Emerald
  static const Color primaryDark = Color(0xFF022C22);
  static const Color secondary = Color(0xFFF59E0B); // Amber Accent

  // Neutral / Background Tokens (Light)
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceSubtleLight = Color(0xFFF1F5F9);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textMutedLight = Color(0xFF94A3B8);

  // Neutral / Background Tokens (Dark)
  static const Color backgroundDark = Color(0xFF090D16);
  static const Color surfaceDark = Color(0xFF111827);
  static const Color surfaceSubtleDark = Color(0xFF1F2937);
  static const Color borderDark = Color(0xFF374151);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
  static const Color textMutedDark = Color(0xFF6B7280);

  // Status & Feedback Tokens
  static const Color destructive = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
}

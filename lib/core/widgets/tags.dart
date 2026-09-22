import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Neutral micro-label on `surface2` — genres, vendor names, condition grades.
class MiniTag extends StatelessWidget {
  const MiniTag({super.key, required this.label, this.fontSize = 9});

  final String label;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: palette.surface2,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppFonts.ui(
          size: fontSize,
          weight: FontWeight.w800,
          color: palette.textDim,
        ),
      ),
    );
  }
}

/// Accent-tinted label — the inline book tag on a Book-Bite.
class AccentTag extends StatelessWidget {
  const AccentTag({super.key, required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Insets.sm, vertical: 4),
      decoration: BoxDecoration(
        color: palette.accentSoft,
        borderRadius: BorderRadius.circular(Radii.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Icon(icon ?? Icons.menu_book_rounded, size: 11, color: palette.accent),
          Text(
            label,
            style: AppFonts.ui(
              size: 10.5,
              weight: FontWeight.w800,
              color: palette.accent,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Best" flag pinned to the corner of a cover when a vendor wins on price.
class BestBadge extends StatelessWidget {
  const BestBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: palette.bg,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          Icon(Icons.star_rounded, size: 10, color: palette.accent),
          Text(
            label,
            style: AppFonts.ui(
              size: 9,
              weight: FontWeight.w800,
              color: palette.accent,
            ),
          ),
        ],
      ),
    );
  }
}

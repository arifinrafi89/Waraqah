import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';
import 'surface_card.dart';

/// Placeholder for a tab whose feature branch has not merged yet. Keeps the
/// shell's five destinations navigable without faking functionality.
class ComingSoonView extends StatelessWidget {
  const ComingSoonView({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.phaseLabel,
  });

  final IconData icon;
  final String title;
  final String message;
  final String phaseLabel;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Insets.xl),
          child: SurfaceCard(
            radius: Radii.hero,
            padding: const EdgeInsets.all(Insets.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: palette.accentSoft,
                    borderRadius: BorderRadius.circular(Radii.card),
                  ),
                  child: Icon(icon, color: palette.accent, size: 24),
                ),
                const SizedBox(height: Insets.lg),
                Text(title, style: context.texts.titleLarge),
                const SizedBox(height: 6),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppFonts.ui(
                    size: 12.5,
                    height: 1.5,
                    color: palette.textDim,
                  ),
                ),
                const SizedBox(height: Insets.lg),
                Text(
                  phaseLabel.toUpperCase(),
                  style: AppFonts.ui(
                    size: 10,
                    weight: FontWeight.w800,
                    color: palette.textFaint,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// A labelled block of settings controls.
class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    super.key,
    required this.label,
    required this.icon,
    required this.child,
  });

  final String label;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 6,
          children: [
            Icon(icon, size: 14, color: palette.accent),
            Text(
              label.toUpperCase(),
              style: AppFonts.ui(
                size: 10,
                weight: FontWeight.w800,
                color: palette.accent,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: Insets.sm + 2),
        child,
      ],
    );
  }
}

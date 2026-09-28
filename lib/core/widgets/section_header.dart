import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_palette.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Title + subtitle on the left, a text action on the right. Every "See all" /
/// "Sort" row on the home and catalog screens is this brick.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.actionIcon,
    this.onAction,
  });

  final String title;
  final String? subtitle;
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.md - 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.texts.titleMedium),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      subtitle!,
                      style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                    ),
                  ),
              ],
            ),
          ),
          if (actionLabel != null) _action(palette),
        ],
      ),
    );
  }

  Widget _action(AppPalette palette) => InkWell(
    onTap: onAction,
    borderRadius: BorderRadius.circular(Radii.sm),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      child: Row(
        children: [
          Text(
            actionLabel!,
            style: AppFonts.ui(
              size: 11.5,
              weight: FontWeight.w800,
              color: palette.accent,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            actionIcon ?? Icons.chevron_right_rounded,
            size: 14,
            color: palette.accent,
          ),
        ],
      ),
    ),
  );
}

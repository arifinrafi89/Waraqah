import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_dimens.dart';
import '../../core/theme/app_palette.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_typography.dart';
import '../../l10n/app_localizations.dart';
import 'nav_destinations.dart';

/// The floating, blurred bottom navigation bar from the design board.
class GlassNavBar extends StatelessWidget {
  const GlassNavBar({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, Insets.lg),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Radii.nav),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: palette.surface.withValues(alpha: 0.72),
              border: Border.all(color: palette.border.withValues(alpha: 0.7)),
              borderRadius: BorderRadius.circular(Radii.nav),
            ),
            child: Row(
              children: [
                for (var i = 0; i < NavDestination.all.length; i++)
                  Expanded(
                    child: _NavItem(
                      destination: NavDestination.all[i],
                      label: NavDestination.all[i].label(l10n),
                      isActive: i == currentIndex,
                      onTap: () => onSelected(i),
                      palette: palette,
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

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.palette,
  });

  final NavDestination destination;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final fg = isActive ? palette.accentInk : palette.textFaint;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.only(top: Insets.sm, bottom: 7),
        decoration: BoxDecoration(
          color: isActive ? palette.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          spacing: 3,
          children: [
            Icon(
              isActive ? destination.activeIcon : destination.icon,
              size: 19,
              color: fg,
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: AppFonts.ui(size: 9.5, weight: FontWeight.w800, color: fg),
            ),
          ],
        ),
      ),
    );
  }
}

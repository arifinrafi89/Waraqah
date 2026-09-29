import 'package:flutter/material.dart';

import '../../core/theme/app_dimens.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import 'nav_destinations.dart';
import 'nav_rail_item.dart';

/// Full-height rail for desktop, docked to the right edge: the five tabs, then
/// the AI button.
class GlassNavRail extends StatelessWidget {
  const GlassNavRail({
    super.key,
    required this.currentIndex,
    required this.onSelected,
    required this.onOpenAi,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onOpenAi;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Container(
      width: 68,
      padding: const EdgeInsets.symmetric(vertical: Insets.md),
      decoration: BoxDecoration(
        color: palette.surface.withValues(alpha: 0.72),
        border: Border(
          left: BorderSide(color: palette.border.withValues(alpha: 0.7)),
        ),
      ),
      child: Column(
        spacing: Insets.sm,
        children: [
          const Spacer(),
          for (var i = 0; i < NavDestination.all.length; i++)
            NavRailItem(
              icon: i == currentIndex
                  ? NavDestination.all[i].activeIcon
                  : NavDestination.all[i].icon,
              label: NavDestination.all[i].label(l10n),
              hint: NavDestination.all[i].hint(l10n),
              isActive: i == currentIndex,
              onTap: () => onSelected(i),
            ),
          const Spacer(),
          NavRailItem(
            icon: Icons.auto_awesome_rounded,
            label: l10n.aiTitle,
            hint: l10n.navAiHint,
            isActive: false,
            onTap: onOpenAi,
          ),
        ],
      ),
    );
  }
}

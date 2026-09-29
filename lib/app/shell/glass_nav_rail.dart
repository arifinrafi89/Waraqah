import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_dimens.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/waraqah_wordmark.dart';
import '../../l10n/app_localizations.dart';
import 'nav_destinations.dart';
import 'nav_rail_item.dart';

/// Floating glass rail for desktop: logo, the five tabs, then the AI button.
/// A mouse wheel over the rail steps through the tabs, one notch per step.
class GlassNavRail extends StatefulWidget {
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
  State<GlassNavRail> createState() => _GlassNavRailState();
}

class _GlassNavRailState extends State<GlassNavRail> {
  static const _notch = Duration(milliseconds: 250);
  DateTime _lastStep = DateTime.fromMillisecondsSinceEpoch(0);

  void _onSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent || event.scrollDelta.dy == 0) return;
    final now = DateTime.now();
    if (now.difference(_lastStep) < _notch) return;
    _lastStep = now;
    final next = widget.currentIndex + (event.scrollDelta.dy > 0 ? 1 : -1);
    if (next >= 0 && next < NavDestination.all.length) widget.onSelected(next);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Listener(
      onPointerSignal: _onSignal,
      child: Padding(
        padding: const EdgeInsets.all(Insets.md),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Radii.nav),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              width: 68,
              padding: const EdgeInsets.symmetric(vertical: Insets.md),
              decoration: BoxDecoration(
                color: palette.surface.withValues(alpha: 0.72),
                border: Border.all(color: palette.border.withValues(alpha: 0.7)),
                borderRadius: BorderRadius.circular(Radii.nav),
              ),
              child: Column(
                spacing: Insets.sm,
                children: [
                  const WaraqahWordmark(size: 16),
                  const Spacer(),
                  for (var i = 0; i < NavDestination.all.length; i++)
                    NavRailItem(
                      icon: i == widget.currentIndex
                          ? NavDestination.all[i].activeIcon
                          : NavDestination.all[i].icon,
                      label: NavDestination.all[i].label(l10n),
                      hint: NavDestination.all[i].hint(l10n),
                      isActive: i == widget.currentIndex,
                      onTap: () => widget.onSelected(i),
                    ),
                  const Spacer(),
                  NavRailItem(
                    icon: Icons.auto_awesome_rounded,
                    label: l10n.aiTitle,
                    hint: l10n.navAiHint,
                    isActive: false,
                    onTap: widget.onOpenAi,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

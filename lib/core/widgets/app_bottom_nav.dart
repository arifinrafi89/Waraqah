import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import 'glass_container.dart';

const _tabs = [
  (icon: Icons.home_rounded, label: 'Home'),
  (icon: Icons.grid_view_rounded, label: 'Catalog'),
  (icon: Icons.swap_horiz_rounded, label: 'P2P'),
  (icon: Icons.forum_rounded, label: 'Bites'),
  (icon: Icons.person_rounded, label: 'Profile'),
];

const _pillDuration = Duration(milliseconds: 380);
const _pillCurve = Curves.easeOutBack;

/// Floating bottom nav rendered once by the app shell (see AppRouter's
/// StatefulShellRoute). Highlights [currentIndex] with a sliding glass pill;
/// [onTap] switches branches.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Positioned(
      left: 14,
      right: 14,
      bottom: 16,
      child: GlassContainer(
        blur: 18,
        opacity: 0.55,
        color: palette.surface,
        borderRadius: BorderRadius.circular(24),
        padding: const EdgeInsets.all(6),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / _tabs.length;
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: _pillDuration,
                  curve: _pillCurve,
                  left: itemWidth * currentIndex,
                  width: itemWidth,
                  top: 0,
                  bottom: 0,
                  child: _Pill(color: palette.accent),
                ),
                Row(
                  children: [
                    for (var i = 0; i < _tabs.length; i++)
                      _NavItem(
                        icon: _tabs[i].icon,
                        label: _tabs[i].label,
                        active: i == currentIndex,
                        activeColor: palette.accentInk,
                        inactiveColor: palette.textFaint,
                        onTap: () => onTap(i),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// The sliding highlight itself: a frosted, tinted pill — the "liquid glass"
/// bit — clipped independently so its blur doesn't smear across the row.
class _Pill extends StatelessWidget {
  const _Pill({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: 14, spreadRadius: -2),
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
    required this.icon,
    required this.label,
    required this.active,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool active;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? activeColor : inactiveColor;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                duration: _pillDuration,
                curve: _pillCurve,
                scale: active ? 1.1 : 1.0,
                child: Icon(icon, size: 19, color: color),
              ),
              const SizedBox(height: 3),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w800, color: color),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_palette.dart';
import 'glass_container.dart';

enum AppTab { home, catalog, p2p, bites, profile }

/// Persistent bottom nav, shared by every top-level page. Highlights [active].
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.active});

  final AppTab active;

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
        child: Row(
          children: [
            _NavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              active: active == AppTab.home,
              onTap: () => context.goNamed('home'),
            ),
            _NavItem(
              icon: Icons.grid_view_rounded,
              label: 'Catalog',
              active: active == AppTab.catalog,
              onTap: () => context.goNamed('catalog'),
            ),
            _NavItem(
              icon: Icons.swap_horiz_rounded,
              label: 'P2P',
              active: active == AppTab.p2p,
              onTap: () => context.goNamed('p2p'),
            ),
            _NavItem(
              icon: Icons.forum_rounded,
              label: 'Bites',
              active: active == AppTab.bites,
              onTap: () => context.goNamed('book-bites'),
            ),
            _NavItem(
              icon: Icons.person_rounded,
              label: 'Profile',
              active: active == AppTab.profile,
              onTap: () => context.goNamed('profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, required this.active, required this.onTap});

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: active ? palette.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 19, color: active ? palette.accentInk : palette.textFaint),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  color: active ? palette.accentInk : palette.textFaint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

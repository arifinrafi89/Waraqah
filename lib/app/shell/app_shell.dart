import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_dimens.dart';
import '../router/app_routes.dart';
import 'ai_fab.dart';
import 'glass_nav_bar.dart';

/// Chrome shared by the five tabs: the branch's page, the floating glass nav bar
/// and the AI assistant button layered over it.
///
/// [StatefulNavigationShell] keeps each branch's own `Navigator` alive, so a
/// tab returns to exactly where the user left it.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final isProfile = shell.currentIndex == ShellTabs.paths.indexOf(AppRoutes.profile);
    final isP2p = shell.currentIndex == ShellTabs.paths.indexOf(AppRoutes.p2p);
    final showFab = !isProfile && !isP2p;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: shell),
          if (showFab)
            Positioned(right: Insets.screen, bottom: 92, child: const AiFab()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GlassNavBar(
              currentIndex: shell.currentIndex,
              onSelected: _goBranch,
            ),
          ),
        ],
      ),
    );
  }

  /// Tapping the active tab again pops it back to its first route.
  void _goBranch(int index) =>
      shell.goBranch(index, initialLocation: index == shell.currentIndex);
}

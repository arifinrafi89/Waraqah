import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// One bottom-nav entry. Labels come from the ARB files so the bar translates
/// with the rest of the app.
class NavDestination {
  const NavDestination(this.icon, this.activeIcon, this.label);

  final IconData icon;
  final IconData activeIcon;
  final String Function(AppL10n l10n) label;

  static const List<NavDestination> all = [
    NavDestination(
      Icons.home_outlined,
      Icons.home_rounded,
      _homeLabel,
    ),
    NavDestination(
      Icons.menu_book_outlined,
      Icons.menu_book_rounded,
      _catalogLabel,
    ),
    NavDestination(
      Icons.swap_horiz_outlined,
      Icons.swap_horiz_rounded,
      _p2pLabel,
    ),
    NavDestination(
      Icons.chat_bubble_outline_rounded,
      Icons.chat_bubble_rounded,
      _bitesLabel,
    ),
    NavDestination(
      Icons.person_outline_rounded,
      Icons.person_rounded,
      _profileLabel,
    ),
  ];
}

String _homeLabel(AppL10n l10n) => l10n.navHome;
String _catalogLabel(AppL10n l10n) => l10n.navCatalog;
String _p2pLabel(AppL10n l10n) => l10n.navP2p;
String _bitesLabel(AppL10n l10n) => l10n.navBites;
String _profileLabel(AppL10n l10n) => l10n.navProfile;

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// One bottom-nav entry. Labels come from the ARB files so the bar translates
/// with the rest of the app.
class NavDestination {
  const NavDestination(this.icon, this.activeIcon, this.label, this.hint);

  final IconData icon;
  final IconData activeIcon;
  final String Function(AppL10n l10n) label;

  /// One-line explanation shown in the rail tooltip.
  final String Function(AppL10n l10n) hint;

  static const List<NavDestination> all = [
    NavDestination(
      Icons.home_outlined,
      Icons.home_rounded,
      _homeLabel,
      _homeHint,
    ),
    NavDestination(
      Icons.menu_book_outlined,
      Icons.menu_book_rounded,
      _catalogLabel,
      _catalogHint,
    ),
    NavDestination(
      Icons.swap_horiz_outlined,
      Icons.swap_horiz_rounded,
      _p2pLabel,
      _p2pHint,
    ),
    NavDestination(
      Icons.chat_bubble_outline_rounded,
      Icons.chat_bubble_rounded,
      _bitesLabel,
      _bitesHint,
    ),
    NavDestination(
      Icons.person_outline_rounded,
      Icons.person_rounded,
      _profileLabel,
      _profileHint,
    ),
  ];
}

String _homeLabel(AppL10n l10n) => l10n.navHome;
String _catalogLabel(AppL10n l10n) => l10n.navCatalog;
String _p2pLabel(AppL10n l10n) => l10n.navP2p;
String _bitesLabel(AppL10n l10n) => l10n.navBites;
String _profileLabel(AppL10n l10n) => l10n.navProfile;
String _homeHint(AppL10n l10n) => l10n.navHomeHint;
String _catalogHint(AppL10n l10n) => l10n.navCatalogHint;
String _p2pHint(AppL10n l10n) => l10n.navP2pHint;
String _bitesHint(AppL10n l10n) => l10n.navBitesHint;
String _profileHint(AppL10n l10n) => l10n.navProfileHint;

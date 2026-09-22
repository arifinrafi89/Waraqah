import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_view.dart';
import '../../../../l10n/app_localizations.dart';

/// The second-hand marketplace tab. Browsing and listing creation arrive in
/// the P2P phase; the route and nav destination exist now so the shell is
/// complete.
class P2pPage extends StatelessWidget {
  const P2pPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ComingSoonView(
      icon: Icons.swap_horiz_rounded,
      title: l10n.comingSoonTitle,
      message: l10n.comingSoonP2p,
      phaseLabel: 'Phase 4',
    );
  }
}

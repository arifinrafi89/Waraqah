import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_view.dart';
import '../../../../l10n/app_localizations.dart';

/// Placeholder while this feature is developed on its own branch. The route
/// exists now so the router and shell can be reviewed on their own.
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ComingSoonView(
      icon: Icons.menu_book_rounded,
      title: AppL10n.of(context)!.comingSoonTitle,
      message: 'Cross-vendor browsing arrives with the marketplace feature.',
      phaseLabel: 'Phase 3',
    );
  }
}

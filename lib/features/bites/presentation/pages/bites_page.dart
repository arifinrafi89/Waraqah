import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_view.dart';
import '../../../../l10n/app_localizations.dart';

/// The Book-Bites tab. The preview strip on Home already renders real cards
/// from this block; the paginated feed and post composer land in Phase 5.
class BitesPage extends StatelessWidget {
  const BitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ComingSoonView(
      icon: Icons.chat_bubble_rounded,
      title: l10n.comingSoonTitle,
      message: l10n.comingSoonBites,
      phaseLabel: 'Phase 5',
    );
  }
}

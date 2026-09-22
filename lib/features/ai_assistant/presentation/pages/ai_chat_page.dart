import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_view.dart';
import '../../../../l10n/app_localizations.dart';

/// Placeholder while this feature is developed on its own branch. The route
/// exists now so the router and shell can be reviewed on their own.
class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ComingSoonView(
      icon: Icons.auto_awesome_rounded,
      title: AppL10n.of(context)!.comingSoonTitle,
      message: 'The Gemini reading assistant arrives with the AI feature.',
      phaseLabel: 'Phase 6',
    );
  }
}

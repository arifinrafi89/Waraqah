import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/p2p_routes.dart';

/// No conversations yet: what will show up here, and a way to the used
/// books.
class InboxEmptyView extends StatelessWidget {
  const InboxEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.sm,
          children: [
            Icon(Icons.forum_outlined, size: 44, color: palette.textFaint),
            Text(l10n.inboxEmptyTitle, style: context.texts.titleMedium),
            Text(
              l10n.inboxEmptyBody,
              textAlign: TextAlign.center,
              style: AppFonts.ui(size: 12.5, color: palette.textDim),
            ),
            const SizedBox(height: Insets.sm),
            SecondaryButton(
              label: l10n.inboxBrowse,
              onPressed: () => context.go(P2pRoutes.p2p),
            ),
          ],
        ),
      ),
    );
  }
}

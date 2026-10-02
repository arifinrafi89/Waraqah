import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// Nothing yet: what will show up here.
class NotificationsEmptyView extends StatelessWidget {
  const NotificationsEmptyView({super.key});

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
            Icon(
              Icons.notifications_none_rounded,
              size: 44,
              color: palette.textFaint,
            ),
            Text(l10n.profileNoNotifications, style: context.texts.titleMedium),
            Text(
              l10n.notificationEmptyBody,
              textAlign: TextAlign.center,
              style: AppFonts.ui(size: 12.5, color: palette.textDim),
            ),
          ],
        ),
      ),
    );
  }
}

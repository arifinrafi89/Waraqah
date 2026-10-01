import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';

/// "Ban Rafi?" with what it does. `true` when the moderator confirms.
Future<bool> confirmBan(BuildContext context, String name) async {
  final l10n = AppL10n.of(context)!;
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.moderationBanTitle(name)),
      content: Text(l10n.moderationBanBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.moderationCancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: TextButton.styleFrom(foregroundColor: context.palette.danger),
          child: Text(l10n.moderationBan),
        ),
      ],
    ),
  );
  return confirmed ?? false;
}

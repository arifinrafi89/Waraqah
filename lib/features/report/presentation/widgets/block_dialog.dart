import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';

/// "Block Tanvir?" with what it does. `true` when the reader confirms.
Future<bool> confirmBlock(BuildContext context, String name) async {
  final l10n = AppL10n.of(context)!;
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.reportBlockTitle(name)),
      content: Text(l10n.reportBlockBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.reportCancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: TextButton.styleFrom(foregroundColor: context.palette.danger),
          child: Text(l10n.reportBlockConfirm),
        ),
      ],
    ),
  );
  return confirmed ?? false;
}

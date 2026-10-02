import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

/// Asks before a Bite (and its comments) is deleted; `true` to go ahead.
Future<bool> confirmBiteDelete(BuildContext context) async {
  final l10n = AppL10n.of(context)!;
  final sure = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.bitesDeleteConfirm),
      content: Text(l10n.bitesDeleteBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.bitesCancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(l10n.bitesDelete),
        ),
      ],
    ),
  );
  return sure ?? false;
}

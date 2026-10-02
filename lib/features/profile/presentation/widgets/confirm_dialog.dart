import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

/// Asks [message] with Cancel and [confirm]; `true` when confirmed.
Future<bool> confirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirm,
}) async =>
    await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: Text(AppL10n.of(dialog)!.profileCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: Text(confirm),
          ),
        ],
      ),
    ) ??
    false;

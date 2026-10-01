import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

/// Asks before a Banner leaves Home; `true` to delete.
Future<bool> confirmBannerDelete(BuildContext context) async {
  final l10n = AppL10n.of(context)!;
  final sure = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.adminCatalogDeleteBannerTitle),
      content: Text(l10n.adminCatalogDeleteBannerBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.adminCatalogCancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(l10n.adminCatalogDelete),
        ),
      ],
    ),
  );
  return sure ?? false;
}

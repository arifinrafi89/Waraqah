import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shelf_entry.dart';
import 'shelf_labels.dart';

/// What the reader picked in the shelf sheet: a shelf, or `null` to take
/// the Book off.
typedef ShelfChoice = ({Shelf? shelf});

/// The three shelves, the [current] one ticked, and Take off when the Book
/// is on one. `null` when dismissed.
Future<ShelfChoice?> showShelfSheet(BuildContext context, Shelf? current) {
  final l10n = AppL10n.of(context)!;
  return showModalBottomSheet<ShelfChoice>(
    context: context,
    showDragHandle: true,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: Insets.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final shelf in Shelf.values)
              ListTile(
                leading: Icon(shelfIcon(shelf)),
                title: Text(l10n.shelfName(shelf)),
                trailing: shelf == current
                    ? Icon(Icons.check_rounded, color: context.palette.accent)
                    : null,
                onTap: () => Navigator.pop(context, (shelf: shelf)),
              ),
            if (current != null)
              ListTile(
                leading: Icon(
                  Icons.remove_circle_outline,
                  color: context.palette.danger,
                ),
                title: Text(l10n.shelfRemove),
                onTap: () => Navigator.pop(context, (shelf: null)),
              ),
          ],
        ),
      ),
    ),
  );
}

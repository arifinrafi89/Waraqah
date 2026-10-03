import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/shelf_providers.dart';
import 'shelf_actions.dart';
import 'shelf_labels.dart';
import 'shelf_sheet.dart';

/// On a book's page: "Add to shelf", or the shelf it's on. Opens the
/// shelf sheet to move it.
class ShelfButton extends ConsumerWidget {
  const ShelfButton({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final shelf = ref.watch(shelfOfProvider(bookId));
    return SecondaryButton(
      label: shelf == null ? l10n.shelfAdd : l10n.shelfName(shelf),
      icon: Icon(
        shelf == null ? Icons.library_add_outlined : shelfIcon(shelf),
        size: 18,
      ),
      onPressed: () async {
        final choice = await showShelfSheet(context, shelf);
        if (choice == null || !context.mounted) return;
        await ref.moveToShelf(context, bookId, choice.shelf);
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shelf_entry.dart';
import 'shelf_book_tile.dart';
import 'shelf_labels.dart';

/// The Books on one shelf, or a note saying how it fills up.
class ShelfList extends StatelessWidget {
  const ShelfList({super.key, required this.shelf, required this.entries});

  final Shelf shelf;
  final List<ShelfEntry> entries;

  @override
  Widget build(BuildContext context) {
    final shown = [
      for (final e in entries)
        if (e.shelf == shelf) e,
    ];
    if (shown.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Text(
          AppL10n.of(context)!.shelfEmpty(shelf),
          textAlign: TextAlign.center,
          style: AppFonts.ui(size: 13, color: context.palette.textDim),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.sm,
        Insets.screen,
        Insets.xl,
      ),
      itemCount: shown.length,
      separatorBuilder: (_, _) => const SizedBox(height: Insets.sm),
      itemBuilder: (_, i) => ShelfBookTile(entry: shown[i]),
    );
  }
}

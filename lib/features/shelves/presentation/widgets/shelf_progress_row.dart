import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shelf_entry.dart';
import 'progress_actions.dart';

/// Under a Book on Reading: how far the reader got, and Update.
class ShelfProgressRow extends ConsumerWidget {
  const ShelfProgressRow({super.key, required this.entry});

  final ShelfEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final (pages, total) = (entry.pagesRead, entry.totalPages);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinearProgressIndicator(
          value: entry.progress / 100,
          color: palette.accent,
          backgroundColor: palette.surface2,
          borderRadius: BorderRadius.circular(4),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                pages != null && total != null
                    ? l10n.readingPages(pages, total)
                    : l10n.readingProgress(entry.progress),
                style: AppFonts.ui(size: 11.5, color: palette.textDim),
              ),
            ),
            TextButton(
              onPressed: () => ref.updateProgress(context, entry),
              child: Text(l10n.readingUpdate),
            ),
          ],
        ),
      ],
    );
  }
}

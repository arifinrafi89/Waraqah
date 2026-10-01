import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/finished_it_providers.dart';
import 'finished_it_actions.dart';

/// "Finished a book you bought?": the reader's delivered books, each one
/// tap away from selling it on. Nothing when there are none.
class FinishedBooksCard extends ConsumerWidget {
  const FinishedBooksCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final books = ref.watch(boughtBooksProvider);
    if (books.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.md),
      child: SurfaceCard(
        padding: const EdgeInsets.all(Insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Insets.sm,
          children: [
            Text(
              l10n.listingFinishedCardTitle,
              style: context.texts.titleSmall,
            ),
            Text(
              l10n.listingFinishedCardBody,
              style: AppFonts.ui(size: 12, color: palette.textDim),
            ),
            Wrap(
              spacing: Insets.sm,
              runSpacing: Insets.sm,
              children: [
                for (final book in books)
                  ActionChip(
                    avatar: const Icon(Icons.done_all_rounded, size: 16),
                    label: Text(book.title),
                    onPressed: () => ref.bookFinished(context, book.bookId),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

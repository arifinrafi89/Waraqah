import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bites/bites_routes.dart';
import '../../../reviews/reviews_routes.dart';

/// "Tell readers what you thought": write a review of the finished Book,
/// or post a Bite tagging it.
class FinishedShareRow extends StatelessWidget {
  const FinishedShareRow({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    void open(String location) {
      Navigator.pop(context);
      context.push(location);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.xs,
      children: [
        Text(
          l10n.readingFinishedShare,
          style: AppFonts.ui(size: 12.5, color: context.palette.textDim),
        ),
        Wrap(
          spacing: Insets.sm,
          runSpacing: Insets.sm,
          children: [
            ActionChip(
              avatar: const Icon(Icons.rate_review_outlined, size: 16),
              label: Text(l10n.readingWriteReview),
              onPressed: () => open(ReviewsRoutes.forBook(bookId)),
            ),
            ActionChip(
              avatar: const Icon(Icons.edit_note_rounded, size: 16),
              label: Text(l10n.readingPostBite),
              onPressed: () => open(BitesRoutes.composeFor(bookId: bookId)),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../orders/presentation/widgets/order_labels.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_icon_button.dart';
import '../../domain/entities/review.dart';
import 'review_actions.dart';
import 'review_stars.dart';
import 'verified_badge.dart';

/// One review: name, stars, Verified Purchase, date and text. The Reader's
/// own gets Edit / Delete; others' can be reported.
class ReviewTile extends ConsumerWidget {
  const ReviewTile({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final date = [
      context.orderDate(review.createdAt),
      if (review.editedAt != null) l10n.reviewEdited,
    ].join(' · ');
    return SurfaceCard(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(Insets.md, Insets.sm, 0, Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.isMine ? l10n.reviewYou : review.authorName,
                  style: AppFonts.ui(
                    size: 13,
                    weight: FontWeight.w800,
                    color: palette.text,
                  ),
                ),
              ),
              if (review.isMine)
                PopupMenuButton<bool>(
                  tooltip: l10n.reviewMore,
                  onSelected: (edit) => edit
                      ? ref.writeReview(context, review.bookId, mine: review)
                      : ref.deleteReview(context, review.bookId),
                  itemBuilder: (_) => [
                    PopupMenuItem(value: true, child: Text(l10n.reviewEdit)),
                    PopupMenuItem(value: false, child: Text(l10n.reviewDelete)),
                  ],
                )
              else
                ReportIconButton(
                  target: ReportTarget(
                    kind: ReportTargetKind.review,
                    id: review.id,
                  ),
                ),
            ],
          ),
          Wrap(
            spacing: Insets.sm,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ReviewStars(stars: review.stars),
              if (review.verified) const VerifiedBadge(),
              Text(
                date,
                style: AppFonts.ui(size: 11, color: palette.textFaint),
              ),
            ],
          ),
          if (review.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: Insets.sm, right: Insets.md),
              child: Text(review.text, style: context.texts.bodySmall),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_review.dart';
import 'review_tile.dart';

/// Reader reviews, or a short empty state when there are none.
class BookReviewsSection extends StatelessWidget {
  const BookReviewsSection({super.key, required this.reviews});

  final List<BookReview> reviews;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.bookDetailReviews,
          subtitle: reviews.isEmpty
              ? null
              : l10n.bookDetailReviewsSub(reviews.length),
        ),
        if (reviews.isEmpty)
          SurfaceCard(
            width: double.infinity,
            padding: const EdgeInsets.all(Insets.lg),
            child: Text(
              l10n.bookDetailNoReviews,
              style: context.texts.bodySmall,
            ),
          )
        else
          Column(
            spacing: 10,
            children: [
              for (final review in reviews) ReviewTile(review: review),
            ],
          ),
      ],
    );
  }
}

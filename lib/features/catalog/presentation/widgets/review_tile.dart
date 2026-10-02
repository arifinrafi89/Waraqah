import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_review.dart';
import 'rating_stars.dart';

/// One reader review: avatar, name, stars and the review text.
class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
    required this.review,
    this.verifiedPurchase = false,
  });

  final BookReview review;
  final bool verifiedPurchase;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: Insets.sm,
            children: [
              Container(
                width: Sizes.avatar,
                height: Sizes.avatar,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.chipFor(review.avatarSeed),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  review.initial,
                  style: AppFonts.ui(
                    size: 12,
                    weight: FontWeight.w800,
                    color: palette.accentInk,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.reviewerName,
                      style: AppFonts.ui(
                        size: 12,
                        weight: FontWeight.w800,
                        color: palette.text,
                      ),
                    ),
                    Text(
                      review.reviewerHandle,
                      style: AppFonts.ui(size: 10.5, color: palette.textFaint),
                    ),
                    if (verifiedPurchase)
                      Text(
                        AppL10n.of(context)!.bookReviewVerified,
                        style: AppFonts.ui(
                          size: 10,
                          weight: FontWeight.w800,
                          color: palette.accent,
                        ),
                      ),
                  ],
                ),
              ),
              RatingStars(rating: review.rating.toDouble()),
            ],
          ),
          const SizedBox(height: Insets.sm),
          Text(review.text, style: context.texts.bodySmall),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/seller_profile.dart';
import 'rating_stars.dart';
import 'seller_labels.dart';

/// What the people a reader dealt with said, newest first.
class SellerReviews extends StatelessWidget {
  const SellerReviews({super.key, required this.reviews});

  final List<SellerReview> reviews;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.sellerReviews),
        if (reviews.isEmpty)
          Text(
            l10n.sellerNoRatings,
            style: AppFonts.ui(size: 12.5, color: palette.textDim),
          ),
        for (final review in reviews)
          Padding(
            padding: const EdgeInsets.only(bottom: Insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Row(
                  spacing: Insets.sm,
                  children: [
                    RatingStars(stars: review.stars.toDouble(), size: 13),
                    Expanded(
                      child: Text(
                        '${review.fromName} · '
                        '${memberSinceDate(context, review.at)}',
                        style: AppFonts.ui(
                          size: 11.5,
                          color: palette.textFaint,
                        ),
                      ),
                    ),
                  ],
                ),
                if (review.comment case final comment?)
                  Text(
                    comment,
                    style: AppFonts.ui(size: 13, color: palette.text),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

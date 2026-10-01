import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/seller_profile.dart';
import 'rating_stars.dart';
import 'seller_labels.dart';

/// Who the reader is: name, area, member since, books sold and rating.
class SellerSummary extends StatelessWidget {
  const SellerSummary({super.key, required this.seller});

  final SellerProfile seller;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 12.5, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.lg),
      child: Row(
        spacing: Insets.md,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: palette.accentSoft,
            child: Text(
              seller.name.characters.first,
              style: AppFonts.ui(
                size: 20,
                weight: FontWeight.w800,
                color: palette.accent,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(seller.name, style: context.texts.titleLarge),
                Text('${seller.area}, ${seller.district}', style: dim),
                Text(
                  l10n.sellerMemberSince(
                    memberSinceDate(context, seller.memberSince),
                  ),
                  style: dim,
                ),
                Text(l10n.sellerBooksSold(seller.booksSold), style: dim),
                Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (seller.ratingAverage case final average?)
                      RatingStars(stars: average),
                    Text(
                      l10n.ratingLine(seller),
                      style: AppFonts.ui(
                        size: 12.5,
                        weight: FontWeight.w700,
                        color: palette.text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

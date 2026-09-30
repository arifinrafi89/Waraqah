import '../../../../core/theme/app_palette.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';

class P2pMyListingCard extends StatelessWidget {
  const P2pMyListingCard({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;

    final statusLabel = switch (listing.status) {
      P2pListingStatus.draft => l10n.listingStatusDraft,
      P2pListingStatus.inReview => l10n.listingStatusInReview,
      P2pListingStatus.changesRequested => l10n.listingStatusChangesRequested,
      P2pListingStatus.rejected => l10n.listingStatusRejected,
      P2pListingStatus.live => l10n.listingStatusLive,
      P2pListingStatus.sold => l10n.listingStatusSold,
    };

    final conditionLabel = switch (listing.condition) {
      BookCondition.likeNew => l10n.listingConditionLikeNew,
      BookCondition.veryGood => l10n.listingConditionVeryGood,
      BookCondition.good => l10n.listingConditionGood,
      BookCondition.acceptable => l10n.listingConditionAcceptable,
    };

    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(listing.title, style: context.texts.titleMedium),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusColor(listing.status, palette).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusLabel,
                  style: AppFonts.ui(
                    size: 11,
                    color: _statusColor(listing.status, palette),
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Insets.sm),
          Text(
            '${l10n.listingConditionPrefix}$conditionLabel · ৳${listing.priceBdt}',
            style: AppFonts.ui(size: 13, color: palette.textFaint),
          ),
          if (listing.status == P2pListingStatus.rejected &&
              listing.rejectionReason != null) ...[
            const SizedBox(height: Insets.sm),
            Text(
              '${l10n.listingReasonPrefix}${listing.rejectionReason}',
              style: AppFonts.ui(size: 13, color: palette.danger),
            ),
          ],
        ],
      ),
    );
  }

  Color _statusColor(P2pListingStatus status, AppPalette palette) {
    return switch (status) {
      P2pListingStatus.draft => palette.textFaint,
      P2pListingStatus.inReview => palette.accent,
      P2pListingStatus.changesRequested => palette.accent,
      P2pListingStatus.rejected => palette.danger,
      P2pListingStatus.live => palette.accent,
      P2pListingStatus.sold => palette.text,
    };
  }
}

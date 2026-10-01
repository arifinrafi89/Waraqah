import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../p2p_routes.dart';
import 'p2p_labels.dart';

/// One of the reader's own listings with its status. Opens the listing,
/// where buyers' offers and messages about it are listed.
class P2pMyListingCard extends StatelessWidget {
  const P2pMyListingCard({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final statusColor = switch (listing.status) {
      P2pListingStatus.rejected => palette.danger,
      P2pListingStatus.draft || P2pListingStatus.sold => palette.textFaint,
      _ => palette.accent,
    };
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: InkWell(
        onTap: () => context.push(P2pRoutes.listingDetailFor(listing.id)),
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Insets.sm,
          children: [
            Row(
              spacing: Insets.sm,
              children: [
                Expanded(
                  child: Text(listing.title, style: context.texts.titleMedium),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(Radii.sm),
                  ),
                  child: Text(
                    l10n.listingStatus(listing.status),
                    style: AppFonts.ui(
                      size: 11,
                      color: statusColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '${l10n.listingConditionPrefix}'
              '${l10n.conditionLabel(listing.condition)} · '
              '${Bdt.format(listing.priceBdt)}',
              style: AppFonts.ui(size: 13, color: palette.textFaint),
            ),
            if (listing.status == P2pListingStatus.rejected &&
                listing.rejectionReason != null)
              Text(
                '${l10n.listingReasonPrefix}${listing.rejectionReason}',
                style: AppFonts.ui(size: 13, color: palette.danger),
              ),
          ],
        ),
      ),
    );
  }
}

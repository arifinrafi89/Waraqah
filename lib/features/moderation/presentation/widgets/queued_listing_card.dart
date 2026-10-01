import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../domain/entities/queued_listing.dart';
import 'listing_decision_bar.dart';
import 'listing_photo_strip.dart';
import 'moderation_labels.dart';

/// A Listing waiting for approval: what it is, who's selling, the photos,
/// and the three decisions.
class QueuedListingCard extends StatelessWidget {
  const QueuedListingCard({super.key, required this.listing});

  final QueuedListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.md,
            children: [
              SizedBox(
                width: 64,
                child: CoverArt(
                  title: listing.title,
                  seed: listing.coverSeed,
                  aspectRatio: 2 / 3,
                  fontSize: 8,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(listing.title, style: context.texts.titleSmall),
                    Text(
                      '${listing.sellerName} · '
                      '${l10n.moderationStrikes(listing.sellerStrikes)}',
                      style: dim,
                    ),
                    Wrap(
                      spacing: Insets.sm,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          Bdt.format(listing.priceBdt),
                          style: AppFonts.numeric(
                            size: 16,
                            color: palette.accent,
                          ),
                        ),
                        if (listing.newPriceBdt case final price?)
                          Text(
                            l10n.moderationNewPrice(Bdt.format(price)),
                            style: dim,
                          ),
                      ],
                    ),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        MiniTag(label: l10n.conditionLabel(listing.condition)),
                        for (final flag in listing.flags)
                          MiniTag(label: l10n.flagLabel(flag)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (listing.note case final note?)
            Text(
              note,
              style: AppFonts.ui(size: 12.5, height: 1.4, color: palette.text),
            ),
          ListingPhotoStrip(listing: listing),
          ListingDecisionBar(listing: listing),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/cover_gradient.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/queued_listing.dart';
import 'moderation_labels.dart';

/// The seller's photos, one tile each, named by what they show.
class ListingPhotoStrip extends StatelessWidget {
  const ListingPhotoStrip({super.key, required this.listing});

  final QueuedListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    if (listing.photos.isEmpty) {
      return Text(
        l10n.moderationNoPhotos,
        style: AppFonts.ui(size: 12, color: palette.danger),
      );
    }
    return GridView.extent(
      maxCrossAxisExtent: 72,
      childAspectRatio: 3 / 4,
      mainAxisSpacing: Insets.sm,
      crossAxisSpacing: Insets.sm,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final (i, slot) in listing.photos.indexed)
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: CoverGradient.of(
                palette.chipFor(listing.coverSeed + i),
              ),
              borderRadius: BorderRadius.circular(Radii.sm),
            ),
            child: Text(
              l10n.photoLabel(slot),
              style: AppFonts.ui(
                size: 10,
                weight: FontWeight.w800,
                color: palette.accentInk,
              ),
            ),
          ),
      ],
    );
  }
}

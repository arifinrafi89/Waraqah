import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../p2p/p2p_routes.dart';
import '../../../p2p/presentation/widgets/p2p_labels.dart';
import '../../domain/entities/inbox_thread.dart';

/// The book a thread is about, pinned on top so both sides always know
/// which copy they're discussing. Opens the listing.
class ListingPin extends StatelessWidget {
  const ListingPin({super.key, required this.listing});

  final ThreadListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final onSale = listing.status == P2pListingStatus.live;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.sm),
      child: InkWell(
        onTap: () => context.push(P2pRoutes.listingDetailFor(listing.id)),
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Row(
          spacing: Insets.md,
          children: [
            SizedBox(
              width: 34,
              child: CoverArt(
                title: listing.title,
                seed: listing.coverSeed,
                aspectRatio: 2 / 3,
                fontSize: 5,
                radius: 5,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    listing.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.texts.titleSmall,
                  ),
                  Text(
                    '${Bdt.format(listing.priceBdt)} · '
                    '${listing.isNegotiable ? l10n.usedNegotiable : l10n.usedFixedPrice}',
                    style: AppFonts.ui(size: 11.5, color: palette.textDim),
                  ),
                ],
              ),
            ),
            Text(
              l10n.marketStatus(listing.status),
              style: AppFonts.ui(
                size: 11,
                weight: FontWeight.w800,
                color: onSale ? palette.accent : palette.textFaint,
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: palette.textFaint),
          ],
        ),
      ),
    );
  }
}

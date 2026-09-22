import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../domain/entities/p2p_listing.dart';

/// Compact second-hand listing tile with the condition grade on the cover.
class P2pCard extends StatelessWidget {
  const P2pCard({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      width: Sizes.p2pCardWidth,
      clip: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoverArt(
            title: listing.title,
            seed: listing.coverSeed,
            aspectRatio: 1,
            centerTitle: true,
            cornerTag: _ConditionBadge(label: listing.conditionLabel),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 9, 10, 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  listing.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(
                    size: 11.5,
                    weight: FontWeight.w800,
                    color: palette.text,
                    height: 1.3,
                  ),
                ),
                Text(
                  listing.sellerLine,
                  style: AppFonts.ui(size: 10, color: palette.textFaint),
                ),
                Text(
                  Bdt.format(listing.priceBdt),
                  style: AppFonts.numeric(size: 13, color: palette.accent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConditionBadge extends StatelessWidget {
  const _ConditionBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppFonts.ui(
          size: 8.5,
          weight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }
}

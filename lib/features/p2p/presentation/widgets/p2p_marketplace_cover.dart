import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../domain/entities/p2p_listing.dart';

class P2pMarketplaceCover extends StatelessWidget {
  const P2pMarketplaceCover({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    // The better the copy, the stronger the badge.
    final (badge, ink) = switch (listing.condition) {
      BookCondition.likeNew => (palette.accent, palette.accentInk),
      BookCondition.veryGood => (palette.accentSoft, palette.text),
      BookCondition.good => (palette.surface2, palette.text),
      BookCondition.acceptable => (palette.surface, palette.danger),
    };

    return Stack(
      fit: StackFit.expand,
      children: [
        CoverArt(
          title: listing.title,
          seed: listing.coverSeed,
          aspectRatio: null,
          radius: 14,
          centerTitle: true,
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: badge.withValues(alpha: 0.92),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              AppL10n.of(context)!.conditionLabel(listing.condition),
              style: AppFonts.ui(size: 9, weight: FontWeight.w800, color: ink),
            ),
          ),
        ),
      ],
    );
  }
}

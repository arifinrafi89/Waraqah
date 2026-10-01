import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/fair_price.dart';
import '../providers/p2p_add_listing_notifier.dart';
import 'fair_price_bar.dart';

/// Under the price field: the fair range for this copy, where the asking
/// price sits in it, and a warning when it's more than buying new.
class FairPriceMeter extends ConsumerWidget {
  const FairPriceMeter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final draft = ref.watch(p2pAddListingProvider);
    final fair = FairPrice.of(
      newPriceBdt: draft.newPriceBdt,
      condition: draft.condition,
      flags: draft.flags.length,
    );
    if (fair == null) {
      return Text(
        l10n.listingFairPriceUnknown,
        style: AppFonts.ui(size: 12, color: palette.textDim),
      );
    }
    final asking = draft.priceBdt;
    final verdict = asking > 0 ? fair.verdict(asking) : null;
    final newPrice = Bdt.format(fair.newPriceBdt);
    final (message, color) = switch (verdict) {
      PriceVerdict.low => (l10n.listingPriceLow, palette.accent),
      PriceVerdict.fair => (l10n.listingPriceFair, palette.accent),
      PriceVerdict.high => (l10n.listingPriceHigh, palette.textDim),
      PriceVerdict.aboveNew => (
        l10n.listingPriceAboveNew(newPrice),
        palette.danger,
      ),
      null => (null, palette.textDim),
    };
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          Text(
            l10n.listingFairPrice(
              Bdt.format(fair.lowBdt),
              Bdt.format(fair.highBdt),
            ),
            style: context.texts.titleSmall,
          ),
          Text(
            l10n.listingFairPriceBasis(newPrice),
            style: AppFonts.ui(size: 11.5, color: palette.textDim),
          ),
          FairPriceBar(fair: fair, askingBdt: asking),
          if (message != null)
            Text(
              message,
              style: AppFonts.ui(
                size: 12.5,
                weight: FontWeight.w700,
                color: color,
              ),
            ),
        ],
      ),
    );
  }
}

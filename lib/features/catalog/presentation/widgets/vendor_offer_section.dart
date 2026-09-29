import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_details.dart';
import 'vendor_offer_tile.dart';

/// The cross-vendor price comparison, cheapest first.
class VendorOfferSection extends StatelessWidget {
  const VendorOfferSection({super.key, required this.details});

  final BookDetails details;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final best = details.bestOffer;
    final offers = details.offers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: l10n.bookDetailComparePrices,
          subtitle: l10n.bookDetailComparePricesSub(offers.length),
        ),
        SurfaceCard(
          clip: true,
          child: Column(
            children: [
              for (var i = 0; i < offers.length; i++) ...[
                if (i > 0) Divider(height: 1, color: palette.border),
                VendorOfferTile(
                  offer: offers[i],
                  isLowest: identical(offers[i], best),
                ),
              ],
            ],
          ),
        ),
        if (details.savingsBdt > 0)
          Padding(
            padding: const EdgeInsets.only(top: Insets.sm, left: 2),
            child: Text(
              l10n.bookDetailSave(Bdt.format(details.savingsBdt)),
              style: AppFonts.ui(
                size: 11.5,
                weight: FontWeight.w700,
                color: palette.accent,
              ),
            ),
          ),
      ],
    );
  }
}

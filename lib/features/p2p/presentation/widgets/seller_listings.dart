import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../p2p_routes.dart';
import 'p2p_card.dart';

/// What a reader is selling now, as a grid of tiles that open each one.
class SellerListings extends StatelessWidget {
  const SellerListings({super.key, required this.listings});

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.sellerOnSale),
        if (listings.isEmpty)
          Text(
            l10n.sellerNothingOnSale,
            style: AppFonts.ui(size: 12.5, color: context.palette.textDim),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listings.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160,
              mainAxisSpacing: Insets.md,
              crossAxisSpacing: Insets.md,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (_, i) => GestureDetector(
              onTap: () =>
                  context.push(P2pRoutes.listingDetailFor(listings[i].id)),
              child: P2pCard(listing: listings[i]),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../domain/entities/p2p_listing.dart';
import 'p2p_marketplace_cover.dart';
import 'p2p_marketplace_message_button.dart';
import 'p2p_marketplace_price_block.dart';

class P2pMarketplaceCard extends StatelessWidget {
  const P2pMarketplaceCard({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SurfaceCard(
      clip: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          P2pMarketplaceCover(listing: listing),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: palette.text,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  listing.sellerLine,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: palette.textFaint,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: P2pMarketplacePriceBlock(
                        price: Bdt.format(listing.priceBdt),
                        available: listing.availabilityLabel,
                        color: listing.isAvailable ? palette.accent : palette.textFaint,
                      ),
                    ),
                    P2pMarketplaceMessageButton(
                      color: palette.accentSoft,
                      accent: palette.accent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

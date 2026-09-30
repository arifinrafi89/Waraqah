import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../domain/entities/p2p_listing.dart';
import 'p2p_marketplace_card.dart';

class P2pMarketplaceGrid extends StatelessWidget {
  const P2pMarketplaceGrid({
    super.key,
    required this.listings,
  });

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.sm,
        Insets.screen,
        0,
      ),
      child: GridView.builder(
        itemCount: listings.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.52,
        ),
        itemBuilder: (_, index) => P2pMarketplaceCard(listing: listings[index]),
      ),
    );
  }
}

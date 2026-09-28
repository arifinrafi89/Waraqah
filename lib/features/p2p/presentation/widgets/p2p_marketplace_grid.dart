import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../domain/entities/p2p_listing.dart';
import 'p2p_marketplace_card.dart';

class P2pMarketplaceGrid extends StatelessWidget {
  const P2pMarketplaceGrid({
    super.key,
    required this.listings,
    required this.filter,
    required this.query,
  });

  final List<P2pListing> listings;
  final P2pFilter filter;
  final String query;

  @override
  Widget build(BuildContext context) {
    final visible = listings.where((listing) => listing.matchesFilter(filter, query)).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.screen, Insets.sm, Insets.screen, 0),
      child: GridView.builder(
        itemCount: visible.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (_, index) => P2pMarketplaceCard(listing: visible[index]),
      ),
    );
  }
}

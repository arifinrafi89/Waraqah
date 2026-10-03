import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/p2p_filter_providers.dart';
import '../widgets/p2p_marketplace_add_button.dart';
import '../widgets/p2p_marketplace_filter_bar.dart';
import '../widgets/p2p_marketplace_grid.dart';
import '../widgets/p2p_marketplace_header.dart';
import '../widgets/p2p_marketplace_result_row.dart';
import '../widgets/p2p_marketplace_search_field.dart';

class P2pMarketplacePage extends ConsumerWidget {
  const P2pMarketplacePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(filteredP2pListingsProvider);

    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: Column(
            children: [
              P2pMarketplaceHeader(listings: listings),
              const P2pMarketplaceSearchField(),
              const P2pMarketplaceFilterBar(),
              P2pMarketplaceResultRow(listings: listings),
              Expanded(child: P2pMarketplaceGrid(listings: listings)),
            ],
          ),
        ),
        const P2pMarketplaceAddButton(),
      ],
    );
  }
}

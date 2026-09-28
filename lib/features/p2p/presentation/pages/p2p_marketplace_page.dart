import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_providers.dart';
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
    final filter = ref.watch(p2pFilterProvider);
    final query = ref.watch(p2pQueryProvider);

    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: Column(
            children: [
              P2pMarketplaceHeader(listings: listings),
              P2pMarketplaceSearchField(ref: ref),
              P2pMarketplaceFilterBar(filter: filter, ref: ref),
              P2pMarketplaceResultRow(listings: listings),
              Expanded(
                child: P2pMarketplaceGrid(
                  listings: listings,
                  filter: filter,
                  query: query,
                ),
              ),
            ],
          ),
        ),
        const P2pMarketplaceAddButton(),
      ],
    );
  }
}

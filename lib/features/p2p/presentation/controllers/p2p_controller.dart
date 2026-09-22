import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/p2p_providers.dart';
import '../../domain/models/p2p_listing.dart';

/// P2P feed sort order.
enum P2pSort { none, priceLowToHigh, priceHighToLow }

/// Selected condition filter; null means "All".
final p2pConditionFilterProvider = StateProvider<P2pCondition?>((ref) => null);

final p2pSortProvider = StateProvider<P2pSort>((ref) => P2pSort.none);

/// P2P feed grid: available-only listings, filtered and sorted by the
/// active selections.
final filteredP2pListingsProvider =
    FutureProvider<List<P2pListing>>((ref) async {
  final condition = ref.watch(p2pConditionFilterProvider);
  final sort = ref.watch(p2pSortProvider);
  final allListings = await ref.watch(p2pListingsProvider.future);
  final listings = allListings
      .where((listing) => listing.status == P2pStatus.available)
      .where((listing) => condition == null || listing.condition == condition)
      .toList();

  switch (sort) {
    case P2pSort.none:
      return listings;
    case P2pSort.priceLowToHigh:
      return listings..sort((a, b) => a.price.compareTo(b.price));
    case P2pSort.priceHighToLow:
      return listings..sort((a, b) => b.price.compareTo(a.price));
  }
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/domain/models/p2p_listing.dart';
import '../../../home/presentation/controllers/home_controller.dart';

/// P2P feed sort order.
enum P2pSort { none, priceLowToHigh, priceHighToLow }

/// Selected condition filter; null means "All".
final p2pConditionFilterProvider = StateProvider<P2pCondition?>((ref) => null);

final p2pSortProvider = StateProvider<P2pSort>((ref) => P2pSort.none);

/// P2P feed grid: available-only listings, filtered and sorted by the
/// active selections.
final filteredP2pListingsProvider = Provider<List<P2pListing>>((ref) {
  final condition = ref.watch(p2pConditionFilterProvider);
  final sort = ref.watch(p2pSortProvider);
  final listings = ref
      .watch(p2pListingsProvider)
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

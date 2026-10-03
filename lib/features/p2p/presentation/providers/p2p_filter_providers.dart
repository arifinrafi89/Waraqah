import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../profile/presentation/providers/address_providers.dart';
import '../../domain/entities/p2p_listing.dart';
import 'p2p_providers.dart';

/// The marketplace's filters. Location is a division (by its English
/// name), then one of its districts; Category is a Section, then one of
/// its Categories (by id).
final p2pFilterConditionProvider = selectionProvider<BookCondition?>(null);
final p2pFilterDivisionProvider = selectionProvider<String?>(null);
final p2pFilterDistrictProvider = selectionProvider<String?>(null);
final p2pFilterSectionProvider = selectionProvider<Section?>(null);
final p2pFilterCategoryProvider = selectionProvider<String?>(null);
final p2pFilterMaxPriceProvider = selectionProvider<int?>(null);

final p2pQueryProvider = selectionProvider<String>('');

/// How the marketplace orders what's left after the filters.
enum P2pSort { newest, priceLow, priceHigh }

final p2pSortProvider = selectionProvider<P2pSort>(P2pSort.newest);

/// The marketplace's Listings that match the search and every filter.
final filteredP2pListingsProvider = Provider<List<P2pListing>>((ref) {
  final query = ref.watch(p2pQueryProvider).trim().toLowerCase();
  final condition = ref.watch(p2pFilterConditionProvider);
  final division = ref.watch(p2pFilterDivisionProvider);
  final district = ref.watch(p2pFilterDistrictProvider);
  final section = ref.watch(p2pFilterSectionProvider);
  final categoryId = ref.watch(p2pFilterCategoryProvider);
  final maxPrice = ref.watch(p2pFilterMaxPriceProvider);
  final sort = ref.watch(p2pSortProvider);
  final listings = ref.watch(p2pListingsProvider).value ?? const [];
  final inDivision = division == null
      ? null
      : {
          for (final d
              in (ref.watch(geoProvider).value ?? const [])
                  .where((g) => g.name == division)
                  .expand((g) => g.districts))
            d.name,
        };

  final found = listings.where((listing) {
    final matches =
        query.isEmpty ||
        listing.title.toLowerCase().contains(query) ||
        listing.sellerName.toLowerCase().contains(query) ||
        listing.place.toLowerCase().contains(query);
    if (!matches) return false;
    if (condition != null && listing.condition != condition) return false;
    if (inDivision != null && !inDivision.contains(listing.district)) {
      return false;
    }
    if (district != null && listing.district != district) return false;
    if (section != null && listing.section != section) return false;
    if (categoryId != null && listing.categoryId != categoryId) return false;
    if (maxPrice != null && listing.priceBdt > maxPrice) return false;
    return true;
  }).toList();
  // The server sends the newest first.
  return switch (sort) {
    P2pSort.newest => found,
    P2pSort.priceLow => found..sort((a, b) => a.priceBdt.compareTo(b.priceBdt)),
    P2pSort.priceHigh =>
      found..sort((a, b) => b.priceBdt.compareTo(a.priceBdt)),
  };
});

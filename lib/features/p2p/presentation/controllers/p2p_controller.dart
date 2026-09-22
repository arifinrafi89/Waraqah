import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/profile.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
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

/// P2P feed page: filtered/sorted listings plus the book/seller lookups the
/// grid renders with.
final p2pFeedProvider = FutureProvider<
    ({
      List<P2pListing> listings,
      Map<String, Book> books,
      Map<String, Profile> profiles,
    })>((ref) async {
  final listings = await ref.watch(filteredP2pListingsProvider.future);
  final books = {
    for (final b in await ref.watch(booksProvider.future)) b.id: b,
  };
  final profiles = {
    for (final p in await ref.watch(profilesProvider.future)) p.id: p,
  };
  return (listings: listings, books: books, profiles: profiles);
});

/// A single listing's detail plus its book/seller lookups; `listing` is null
/// when [listingId] has no match.
final p2pListingDetailProvider = FutureProvider.family<
    ({P2pListing? listing, Book? book, Profile? seller}), String>(
  (ref, listingId) async {
    final listings = await ref.watch(p2pListingsProvider.future);
    final listing = listings.where((l) => l.id == listingId).firstOrNull;
    if (listing == null) return (listing: null, book: null, seller: null);

    final books = await ref.watch(booksProvider.future);
    final profiles = await ref.watch(profilesProvider.future);
    return (
      listing: listing,
      book: books.where((b) => b.id == listing.bookId).firstOrNull,
      seller: profiles.where((p) => p.id == listing.sellerId).firstOrNull,
    );
  },
);

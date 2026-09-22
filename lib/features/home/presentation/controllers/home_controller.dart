import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/profile.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../p2p/data/p2p_providers.dart';
import '../../../p2p/domain/models/p2p_listing.dart';

final homeBookFilterProvider =
    StateProvider<BookFilter>((ref) => BookFilter.all);

final homeBookSortProvider =
    StateProvider<BookSort>((ref) => BookSort.none);

/// New Books grid, filtered and sorted by the active selections.
final filteredBooksProvider = FutureProvider<List<Book>>((ref) async {
  final filter = ref.watch(homeBookFilterProvider);
  final sort = ref.watch(homeBookSortProvider);
  final books = await ref.watch(booksProvider.future);
  return sortBooks(filterBooks(books, filter), sort);
});

/// P2P strip: available listings (independent of the P2P page's own
/// filter/sort selections) plus the book/seller lookups it renders with.
final homeP2pFeedProvider = FutureProvider<
    ({
      List<P2pListing> listings,
      Map<String, Book> books,
      Map<String, Profile> profiles,
    })>((ref) async {
  final allListings = await ref.watch(p2pListingsProvider.future);
  final listings =
      allListings.where((l) => l.status == P2pStatus.available).toList();
  final books = {
    for (final b in await ref.watch(booksProvider.future)) b.id: b,
  };
  final profiles = {
    for (final p in await ref.watch(profilesProvider.future)) p.id: p,
  };
  return (listings: listings, books: books, profiles: profiles);
});

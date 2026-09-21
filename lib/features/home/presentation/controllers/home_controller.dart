import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';
import '../../data/repositories/dummy_p2p_listing_repository.dart';
import '../../data/repositories/dummy_post_repository.dart';
import '../../data/repositories/dummy_profile_repository.dart';
import '../../domain/models/p2p_listing.dart';
import '../../domain/models/post.dart';
import '../../domain/models/profile.dart';
import '../../domain/repositories/p2p_listing_repository.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/repositories/profile_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

final profileRepositoryProvider =
    Provider<ProfileRepository>((ref) => DummyProfileRepository());

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

final homeBookFilterProvider =
    StateProvider<BookFilter>((ref) => BookFilter.all);

final homeBookSortProvider =
    StateProvider<BookSort>((ref) => BookSort.none);

final postsProvider = StateProvider<List<Post>>(
  (ref) => ref.watch(postRepositoryProvider).getPosts(),
);

final profilesProvider = Provider<List<Profile>>(
  (ref) => ref.watch(profileRepositoryProvider).getProfiles(),
);

final p2pListingsProvider = StateProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pListingRepositoryProvider).getListings(),
);

/// New Books grid, filtered and sorted by the active selections.
final filteredBooksProvider = Provider<List<Book>>((ref) {
  final filter = ref.watch(homeBookFilterProvider);
  final sort = ref.watch(homeBookSortProvider);
  final books = ref.watch(booksProvider);
  return sortBooks(filterBooks(books, filter), sort);
});

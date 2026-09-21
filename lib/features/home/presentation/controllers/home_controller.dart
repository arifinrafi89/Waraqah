import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data/dummy_book_repository.dart';
import '../../../../core/models/book.dart';
import '../../../../core/repositories/book_repository.dart';
import '../../data/repositories/dummy_p2p_listing_repository.dart';
import '../../data/repositories/dummy_post_repository.dart';
import '../../data/repositories/dummy_profile_repository.dart';
import '../../domain/models/p2p_listing.dart';
import '../../domain/models/post.dart';
import '../../domain/models/profile.dart';
import '../../domain/repositories/p2p_listing_repository.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/repositories/profile_repository.dart';

/// Home's "All Books / Beneficial / Non-Beneficial" filter chip selection.
enum HomeBookFilter { all, beneficial, nonBeneficial }

final bookRepositoryProvider =
    Provider<BookRepository>((ref) => DummyBookRepository());

final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

final profileRepositoryProvider =
    Provider<ProfileRepository>((ref) => DummyProfileRepository());

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

final homeBookFilterProvider =
    StateProvider<HomeBookFilter>((ref) => HomeBookFilter.all);

final booksProvider = Provider<List<Book>>(
  (ref) => ref.watch(bookRepositoryProvider).getBooks(),
);

final postsProvider = Provider<List<Post>>(
  (ref) => ref.watch(postRepositoryProvider).getPosts(),
);

final profilesProvider = Provider<List<Profile>>(
  (ref) => ref.watch(profileRepositoryProvider).getProfiles(),
);

final p2pListingsProvider = Provider<List<P2pListing>>(
  (ref) => ref.watch(p2pListingRepositoryProvider).getListings(),
);

/// New Books grid, filtered by the active [homeBookFilterProvider] selection.
final filteredBooksProvider = Provider<List<Book>>((ref) {
  final filter = ref.watch(homeBookFilterProvider);
  final books = ref.watch(booksProvider);
  switch (filter) {
    case HomeBookFilter.all:
      return books;
    case HomeBookFilter.beneficial:
      return books.where((book) => book.isBeneficial).toList();
    case HomeBookFilter.nonBeneficial:
      return books.where((book) => !book.isBeneficial).toList();
  }
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/state/selection_notifier.dart';
import '../../data/repositories/p2p_repository_impl.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../domain/repositories/p2p_repository.dart';
import '../../domain/usecases/fetch_listings_for_book_usecase.dart';

final p2pRepositoryProvider = Provider<P2pRepository>(
  (ref) => P2pRepositoryImpl(),
);

final fetchListingsForBookUseCaseProvider = Provider<FetchListingsForBookUseCase>(
  (ref) => FetchListingsForBookUseCase(ref.watch(p2pRepositoryProvider)),
);

final listingsForBookProvider = FutureProvider.family<List<P2pListing>, String>(
  (ref, bookId) => ref.watch(fetchListingsForBookUseCaseProvider).call(bookId),
);

final nearbyListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pRepositoryProvider).fetchNearbyListings(limit: 4),
);

final p2pListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pRepositoryProvider).fetchNearbyListings(limit: 12),
);

final p2pFilterConditionProvider = selectionProvider<BookCondition?>(null);
final p2pFilterDistrictProvider = selectionProvider<String?>(null);
final p2pFilterAreaProvider = selectionProvider<String?>(null);
final p2pFilterCategoryProvider = selectionProvider<String?>(null);
final p2pFilterMaxPriceProvider = selectionProvider<int?>(null);

final p2pQueryProvider = selectionProvider<String>('');

final filteredP2pListingsProvider = Provider<List<P2pListing>>((ref) {
  final query = ref.watch(p2pQueryProvider);
  final condition = ref.watch(p2pFilterConditionProvider);
  final district = ref.watch(p2pFilterDistrictProvider);
  final area = ref.watch(p2pFilterAreaProvider);
  final category = ref.watch(p2pFilterCategoryProvider);
  final maxPrice = ref.watch(p2pFilterMaxPriceProvider);
  
  final asyncListings = ref.watch(p2pListingsProvider);

  return switch (asyncListings) {
    AsyncData(:final value) => value.where((listing) {
        final normalizedQuery = query.trim().toLowerCase();
        final queryMatches =
            normalizedQuery.isEmpty ||
            listing.title.toLowerCase().contains(normalizedQuery) ||
            listing.sellerName.toLowerCase().contains(normalizedQuery) ||
            listing.sellerBatch.toLowerCase().contains(normalizedQuery);

        if (!queryMatches) return false;
        
        if (condition != null && listing.condition != condition) return false;
        if (district != null && listing.district != district) return false;
        if (area != null && listing.area != area) return false;
        if (category != null && listing.category != category) return false;
        if (maxPrice != null && listing.priceBdt > maxPrice) return false;

        return true;
      }).toList(),
    _ => const [],
  };
});

final myListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pRepositoryProvider).fetchMyListings(),
);

final p2pListingDetailProvider = FutureProvider.family<P2pListing?, String>(
  (ref, id) => ref.watch(p2pRepositoryProvider).fetchListing(id),
);

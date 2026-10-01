import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/p2p_repository_impl.dart';
import '../../data/sources/p2p_remote_source.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../domain/repositories/p2p_repository.dart';
import '../../domain/usecases/fetch_listings_for_book_usecase.dart';
import '../../domain/usecases/get_listing.dart';
import '../../domain/usecases/get_listings.dart';
import '../../domain/usecases/get_my_listings.dart';

final p2pRepositoryProvider = Provider<P2pRepository>(
  (ref) => P2pRepositoryImpl(P2pRemoteSource(ref.watch(dioProvider))),
);

final fetchListingsForBookUseCaseProvider =
    Provider<FetchListingsForBookUseCase>(
      (ref) => FetchListingsForBookUseCase(ref.watch(p2pRepositoryProvider)),
    );

final getListingsProvider = Provider<GetListings>(
  (ref) => GetListings(ref.watch(p2pRepositoryProvider)),
);

final getMyListingsProvider = Provider<GetMyListings>(
  (ref) => GetMyListings(ref.watch(p2pRepositoryProvider)),
);

final getListingProvider = Provider<GetListing>(
  (ref) => GetListing(ref.watch(p2pRepositoryProvider)),
);

/// Other readers' copies of a catalog book on sale now.
final listingsForBookProvider = FutureProvider.family<List<P2pListing>, String>(
  (ref, bookId) => ref.watch(fetchListingsForBookUseCaseProvider).call(bookId),
);

/// Home's strip: a few books others are selling now.
final nearbyListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref
      .watch(getListingsProvider)
      .call(const ListingsQuery(onlyAvailable: true, limit: 4)),
);

/// The marketplace: on sale or reserved, the reader's own included.
final p2pListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(getListingsProvider).call(const ListingsQuery()),
);

final p2pFilterConditionProvider = selectionProvider<BookCondition?>(null);
final p2pFilterDistrictProvider = selectionProvider<String?>(null);
final p2pFilterAreaProvider = selectionProvider<String?>(null);
final p2pFilterCategoryProvider = selectionProvider<String?>(null);
final p2pFilterMaxPriceProvider = selectionProvider<int?>(null);

final p2pQueryProvider = selectionProvider<String>('');

final filteredP2pListingsProvider = Provider<List<P2pListing>>((ref) {
  final query = ref.watch(p2pQueryProvider).trim().toLowerCase();
  final condition = ref.watch(p2pFilterConditionProvider);
  final district = ref.watch(p2pFilterDistrictProvider);
  final area = ref.watch(p2pFilterAreaProvider);
  final category = ref.watch(p2pFilterCategoryProvider);
  final maxPrice = ref.watch(p2pFilterMaxPriceProvider);
  final listings = ref.watch(p2pListingsProvider).value ?? const [];

  return listings.where((listing) {
    final matches =
        query.isEmpty ||
        listing.title.toLowerCase().contains(query) ||
        listing.sellerName.toLowerCase().contains(query) ||
        listing.place.toLowerCase().contains(query);
    if (!matches) return false;
    if (condition != null && listing.condition != condition) return false;
    if (district != null && listing.district != district) return false;
    if (area != null && listing.area != area) return false;
    if (category != null && listing.category != category) return false;
    if (maxPrice != null && listing.priceBdt > maxPrice) return false;
    return true;
  }).toList();
});

final myListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(getMyListingsProvider).call(const NoParams()),
);

final p2pListingDetailProvider = FutureProvider.family<P2pListing?, String>(
  (ref, id) => ref.watch(getListingProvider).call(id),
);

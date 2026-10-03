import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/p2p_repository_impl.dart';
import '../../data/sources/p2p_remote_source.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../domain/entities/seller_profile.dart';
import '../../domain/repositories/p2p_repository.dart';
import '../../domain/usecases/fetch_listings_for_book_usecase.dart';
import '../../domain/usecases/get_listing.dart';
import '../../domain/usecases/get_listings.dart';
import '../../domain/usecases/get_my_listings.dart';
import '../../domain/usecases/get_seller.dart';
import '../../domain/usecases/save_listing.dart';

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

final saveListingProvider = Provider<SaveListing>(
  (ref) => SaveListing(ref.watch(p2pRepositoryProvider)),
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

final myListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(getMyListingsProvider).call(const NoParams()),
);

final p2pListingDetailProvider = FutureProvider.family<P2pListing?, String>(
  (ref, id) => ref.watch(getListingProvider).call(id),
);

final getSellerProvider = Provider<GetSeller>(
  (ref) => GetSeller(ref.watch(p2pRepositoryProvider)),
);

/// A reader's seller page: who they are, ratings, what's on sale.
final sellerProvider = FutureProvider.family<SellerProfile?, String>(
  (ref, id) => ref.watch(getSellerProvider).call(id),
);

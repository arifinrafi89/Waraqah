import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/p2p_listing.dart';
import '../domain/repositories/p2p_listing_repository.dart';
import 'repositories/dummy_p2p_listing_repository.dart';

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

final p2pListingsProvider = StateProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pListingRepositoryProvider).getListings(),
);

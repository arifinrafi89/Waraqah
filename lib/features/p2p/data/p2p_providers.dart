import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/p2p_listing.dart';
import '../domain/repositories/p2p_listing_repository.dart';
import 'repositories/dummy_p2p_listing_repository.dart';

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

class P2pListingsNotifier extends AsyncNotifier<List<P2pListing>> {
  @override
  Future<List<P2pListing>> build() =>
      ref.watch(p2pListingRepositoryProvider).getListings();

  Future<void> add(P2pListing listing) async {
    final repository = ref.read(p2pListingRepositoryProvider);
    state = AsyncValue.data(await repository.addListing(listing));
  }
}

final p2pListingsProvider =
    AsyncNotifierProvider<P2pListingsNotifier, List<P2pListing>>(
  P2pListingsNotifier.new,
);

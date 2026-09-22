import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/p2p_listing.dart';
import '../domain/repositories/p2p_listing_repository.dart';
import 'repositories/dummy_p2p_listing_repository.dart';

final p2pListingRepositoryProvider =
    Provider<P2pListingRepository>((ref) => DummyP2pListingRepository());

class P2pListingsNotifier extends Notifier<List<P2pListing>> {
  @override
  List<P2pListing> build() =>
      ref.watch(p2pListingRepositoryProvider).getListings();

  void add(P2pListing listing) {
    state = ref.read(p2pListingRepositoryProvider).addListing(listing);
  }
}

final p2pListingsProvider =
    NotifierProvider<P2pListingsNotifier, List<P2pListing>>(
  P2pListingsNotifier.new,
);

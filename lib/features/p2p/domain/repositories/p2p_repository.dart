import '../entities/p2p_listing.dart';

/// The second-hand marketplace block's contract. Home shows a preview strip;
/// the full browse-and-list flow arrives in the P2P phase.
abstract interface class P2pRepository {
  Future<List<P2pListing>> fetchNearbyListings({int limit = 6});
}

import '../entities/p2p_listing.dart';

abstract interface class P2pRepository {
  Future<List<P2pListing>> fetchNearbyListings({int limit = 6});
  Future<List<P2pListing>> fetchMyListings();
}

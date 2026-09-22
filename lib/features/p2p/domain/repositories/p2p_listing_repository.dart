import '../models/p2p_listing.dart';

abstract class P2pListingRepository {
  Future<List<P2pListing>> getListings();

  /// Adds [listing] to the newest end of the feed and returns the updated list.
  Future<List<P2pListing>> addListing(P2pListing listing);
}

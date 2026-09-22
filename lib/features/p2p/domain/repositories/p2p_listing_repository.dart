import '../models/p2p_listing.dart';

abstract class P2pListingRepository {
  List<P2pListing> getListings();
}

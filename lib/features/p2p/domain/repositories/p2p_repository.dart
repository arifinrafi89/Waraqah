import '../entities/p2p_listing.dart';
import '../entities/seller_profile.dart';
import '../usecases/save_listing.dart';

abstract interface class P2pRepository {
  /// On sale or reserved; with [onlyAvailable], just what others can buy
  /// now (not the reader's own).
  Future<List<P2pListing>> fetchListings({
    bool onlyAvailable = false,
    int? limit,
  });

  Future<List<P2pListing>> fetchMyListings();

  /// `null` when there's no such listing.
  Future<P2pListing?> fetchListing(String id);

  /// Copies of a catalog book other readers are selling now.
  Future<List<P2pListing>> fetchListingsForBook(String bookId);

  /// A reader's seller page; `null` for someone unknown.
  Future<SellerProfile?> fetchSeller(String id);

  /// Saves the reader's own Listing (a draft, or sent for review).
  Future<P2pListing> saveListing(SaveListingParams params);
}

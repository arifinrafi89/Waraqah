import '../entities/p2p_listing.dart';

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
}

import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_fixtures.dart';
import 'p2p_people.dart';

/// Listings on the fake backend, and who each reserved or sold one went to.
/// The inbox changes them when a seller accepts an offer, makes a book
/// available again or marks it sold.
class P2pFakeStore {
  final Map<String, P2pListingModel> _listings = {
    for (final listing in P2pFixtures.listings) listing.id: listing,
  };
  final Map<String, String> _buyers = {...P2pFixtures.buyers};

  Iterable<P2pListingModel> get all => _listings.values;

  P2pListingModel? find(String id) => _listings[id];

  /// Who the listing is reserved for or was sold to.
  String? buyerOf(String listingId) => _buyers[listingId];

  /// Reserved or sold need the [buyerId]; going back to live clears it.
  void setStatus(String id, P2pListingStatus status, {String? buyerId}) {
    final listing = _listings[id];
    if (listing == null) return;
    _listings[id] = listing.copyWith(status: status);
    if (status == P2pListingStatus.live) {
      _buyers.remove(id);
    } else if (buyerId != null) {
      _buyers[id] = buyerId;
    }
  }

  /// The listing as the signed-in reader sees it.
  Map<String, dynamic> json(P2pListingModel listing) => listing
      .copyWith(
        isMine: listing.sellerId == P2pPeople.me,
        isMyDeal: _buyers[listing.id] == P2pPeople.me,
      )
      .toJson();
}

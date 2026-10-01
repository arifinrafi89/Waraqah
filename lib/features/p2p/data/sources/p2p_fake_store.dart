import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_fixtures.dart';
import 'p2p_people.dart';
import 'p2p_ratings.dart';

/// Listings on the fake backend, who each reserved or sold one went to,
/// and the ratings readers gave each other. The inbox changes them when a
/// seller accepts an offer, makes a book available again or marks it sold,
/// and when buyer and seller rate each other.
class P2pFakeStore {
  P2pFakeStore({DateTime Function()? clock}) : now = clock ?? DateTime.now {
    ratings.addAll(P2pRatingSeed.all(now()));
  }

  final DateTime Function() now;
  final Map<String, P2pListingModel> _listings = {
    for (final listing in P2pFixtures.listings) listing.id: listing,
  };
  final Map<String, String> _buyers = {...P2pFixtures.buyers};
  final List<P2pRating> ratings = [];

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

  /// A moderator's decision: live, changes requested or rejected, with
  /// the [reason] the seller sees.
  void moderate(String id, P2pListingStatus status, {String? reason}) {
    final listing = _listings[id];
    if (listing == null) return;
    _listings[id] = listing.copyWith(status: status, rejectionReason: reason);
  }

  /// What [fromId] gave for the sale of [listingId], if they rated it.
  P2pRating? ratingBy(String listingId, String fromId) => ratings
      .where((r) => r.listingId == listingId && r.fromId == fromId)
      .firstOrNull;

  /// Books [personId] has sold: before the app's records, and since.
  int soldBy(String personId) =>
      (P2pPeople.find(personId)?.booksSold ?? 0) +
      all
          .where(
            (l) => l.sellerId == personId && l.status == P2pListingStatus.sold,
          )
          .length;

  /// The listing as the signed-in reader sees it.
  Map<String, dynamic> json(P2pListingModel listing) => listing
      .copyWith(
        isMine: listing.sellerId == P2pPeople.me,
        isMyDeal: _buyers[listing.id] == P2pPeople.me,
      )
      .toJson();
}

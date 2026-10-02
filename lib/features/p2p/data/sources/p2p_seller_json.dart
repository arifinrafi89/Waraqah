import '../../domain/entities/p2p_listing.dart';
import '../models/seller_profile_model.dart';
import 'p2p_fake_store.dart';
import 'p2p_people.dart';

/// A reader's seller page on the fake backend, built from who they are,
/// the ratings they were given and what they're selling.
extension P2pSellerJson on P2pFakeStore {
  /// `null` for someone the marketplace doesn't know.
  Map<String, dynamic>? sellerJson(String id) {
    final person = P2pPeople.find(id);
    if (person == null) return null;
    final given = ratings.where((r) => r.toId == id).toList()
      ..sort((a, b) => b.at.compareTo(a.at));
    final stars = given.fold(0, (sum, r) => sum + r.stars);
    return SellerProfileModel(
      id: id,
      name: person.name,
      area: person.area,
      district: person.district,
      memberSince: person.memberSince,
      booksSold: soldBy(id),
      ratingCount: given.length,
      ratingAverage: given.isEmpty ? null : stars / given.length,
      reviews: [
        for (final rating in given)
          SellerReviewModel(
            fromName: P2pPeople.find(rating.fromId)?.name ?? '',
            stars: rating.stars,
            at: rating.at,
            comment: rating.comment,
          ),
      ],
      listings: [
        for (final listing in all)
          if (listing.sellerId == id && listing.status == P2pListingStatus.live)
            listing.copyWith(isMine: id == P2pPeople.me),
      ],
    ).toJson();
  }
}

import '../../domain/entities/p2p_listing.dart';

/// Seed listings for the "From Students Near You" strip.
abstract final class P2pFixtures {
  static const List<P2pListing> listings = [
    P2pListing(
      id: 'p2p-1',
      title: 'Calculus: Early Transcendentals',
      sellerName: 'Farhan',
      sellerBatch: "CSE '22",
      priceBdt: 900,
      condition: BookCondition.likeNew,
      coverSeed: 3,
    ),
    P2pListing(
      id: 'p2p-2',
      title: 'Introduction to Algorithms',
      sellerName: 'Mukit',
      sellerBatch: "CSE '21",
      priceBdt: 1400,
      condition: BookCondition.good,
      coverSeed: 0,
    ),
    P2pListing(
      id: 'p2p-3',
      title: 'Organic Chemistry',
      sellerName: 'Rafi',
      sellerBatch: "CEE '23",
      priceBdt: 750,
      condition: BookCondition.fair,
      coverSeed: 2,
    ),
    P2pListing(
      id: 'p2p-4',
      title: 'Signals and Systems',
      sellerName: 'Naushad',
      sellerBatch: "EEE '22",
      priceBdt: 820,
      condition: BookCondition.likeNew,
      coverSeed: 1,
    ),
  ];
}

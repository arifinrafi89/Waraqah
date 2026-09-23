import '../../domain/entities/p2p_listing.dart';

/// Seed listings for the P2P marketplace flow.
abstract final class P2pFixtures {
  static const List<P2pListing> listings = [
    P2pListing(
      id: 'p2p-1',
      title: 'Clean Code',
      sellerName: 'Farhan',
      sellerBatch: "CSE '22",
      priceBdt: 320,
      condition: BookCondition.likeNew,
      isAvailable: true,
      coverSeed: 0,
    ),
    P2pListing(
      id: 'p2p-2',
      title: 'Algorithms Unlocked',
      sellerName: 'Arif',
      sellerBatch: "CSE '21",
      priceBdt: 180,
      condition: BookCondition.fair,
      isAvailable: false,
      coverSeed: 1,
    ),
    P2pListing(
      id: 'p2p-3',
      title: 'Introduction to Algorithms',
      sellerName: 'Rakib',
      sellerBatch: "CSE '24",
      priceBdt: 600,
      condition: BookCondition.good,
      isAvailable: true,
      coverSeed: 2,
    ),
    P2pListing(
      id: 'p2p-4',
      title: 'The Pragmatic Programmer',
      sellerName: 'Nabila',
      sellerBatch: "ICE '23",
      priceBdt: 440,
      condition: BookCondition.good,
      isAvailable: true,
      coverSeed: 3,
    ),
    P2pListing(
      id: 'p2p-5',
      title: 'Operating Systems',
      sellerName: 'Talha',
      sellerBatch: "CSE '20",
      priceBdt: 560,
      condition: BookCondition.likeNew,
      isAvailable: false,
      coverSeed: 4,
    ),
    P2pListing(
      id: 'p2p-6',
      title: 'Digital Logic Design',
      sellerName: 'Mahi',
      sellerBatch: "EEE '22",
      priceBdt: 260,
      condition: BookCondition.fair,
      isAvailable: true,
      coverSeed: 5,
    ),
  ];
}

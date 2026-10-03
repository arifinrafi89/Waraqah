import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_listing_seed.dart';
import 'p2p_people.dart';

/// Listings in Waraqah-handled sales (see `HandledSaleFakeStore`): one the
/// reader bought, two the reader sold, and one in a dispute.
final List<P2pListingModel> p2pHandledSeed = [
  seedListing(
    'p2p-hs-1',
    'Thinking, Fast and Slow',
    'p-arif',
    380,
    BookCondition.veryGood,
    status: P2pListingStatus.reserved,
    newPrice: 650,
    categoryId: 'cat-self-help',
  ),
  seedListing(
    'p2p-hs-2',
    'Deep Work',
    P2pPeople.me,
    300,
    BookCondition.good,
    status: P2pListingStatus.sold,
    newPrice: 520,
    categoryId: 'cat-self-help',
  ),
  seedListing(
    'p2p-hs-3',
    'The Alchemist',
    P2pPeople.me,
    220,
    BookCondition.good,
    status: P2pListingStatus.reserved,
    newPrice: 350,
    categoryId: 'cat-fiction',
  ),
  seedListing(
    'p2p-hs-4',
    'Sapiens',
    'p-tanvir',
    450,
    BookCondition.likeNew,
    status: P2pListingStatus.reserved,
    newPrice: 900,
    categoryId: 'cat-academic',
  ),
];

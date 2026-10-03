import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_listing_seed.dart';
import 'p2p_people.dart';

/// The signed-in reader's own Listings: one live, a draft, one in review
/// and one a moderator sent back.
final List<P2pListingModel> p2pMySeed = [
  seedListing(
    'p2p-7',
    'Atomic Habits',
    P2pPeople.me,
    350,
    BookCondition.veryGood,
    bookId: 'bk-atomic',
    newPrice: 590,
    negotiable: true,
    note: 'Read it twice, still in great shape.',
  ),
  seedListing(
    'p2p-draft-1',
    'Design Patterns',
    P2pPeople.me,
    300,
    BookCondition.veryGood,
    status: P2pListingStatus.draft,
    newPrice: 450,
    categoryId: 'cat-programming',
  ),
  seedListing(
    'p2p-review-1',
    'Artificial Intelligence',
    P2pPeople.me,
    400,
    BookCondition.good,
    status: P2pListingStatus.inReview,
    newPrice: 600,
    categoryId: 'cat-data-systems',
  ),
  // A moderator asked for a back cover photo: the reader can edit it
  // and send it again.
  seedListing(
    'p2p-changes-1',
    'Head First Java',
    P2pPeople.me,
    420,
    BookCondition.good,
    status: P2pListingStatus.changesRequested,
    newPrice: 750,
    photos: const ['front'],
    categoryId: 'cat-programming',
  ).copyWith(rejectionReason: 'Please add a photo of the back cover.'),
];

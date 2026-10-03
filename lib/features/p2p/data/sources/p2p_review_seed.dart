import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_listing_seed.dart';

/// Other readers' Listings waiting for a moderator in the Moderation
/// Center.
final List<P2pListingModel> p2pReviewSeed = [
  seedListing(
    'p2p-review-2',
    'Organic Chemistry',
    'p-sadia',
    350,
    BookCondition.good,
    status: P2pListingStatus.inReview,
    newPrice: 650,
    categoryId: 'cat-academic',
    flags: const ['highlighting'],
    photos: const ['front', 'back', 'spine', 'inside'],
    note: 'Some highlighting in chapters 3 to 5.',
  ),
  seedListing(
    'p2p-review-3',
    'Calculus: Early Transcendentals',
    'p-rafi',
    900,
    BookCondition.likeNew,
    status: P2pListingStatus.inReview,
    newPrice: 2800,
    categoryId: 'cat-academic',
    photos: const ['front', 'back'],
    note: 'Brand new copy, never opened.',
  ),
];

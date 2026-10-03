import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_handled_seed.dart';
import 'p2p_listing_seed.dart';
import 'p2p_my_seed.dart';
import 'p2p_people.dart';
import 'p2p_review_seed.dart';

/// Seed listings for the used marketplace. Three are the signed-in
/// reader's own ([P2pPeople.me]).
abstract final class P2pFixtures {
  static final List<P2pListingModel> listings = [
    seedListing(
      'p2p-1',
      'Clean Code',
      'p-tanvir',
      320,
      BookCondition.likeNew,
      bookId: 'bk-cleancode',
      newPrice: 500,
      negotiable: true,
      note: 'Read once. No highlights or notes.',
      category: 'Software Engineering',
    ),
    seedListing(
      'p2p-2',
      'Algorithms Unlocked',
      'p-arif',
      180,
      BookCondition.acceptable,
      status: P2pListingStatus.sold,
      newPrice: 250,
      category: 'Computer Science',
    ),
    seedListing(
      'p2p-3',
      'Introduction to Algorithms',
      'p-rakib',
      600,
      BookCondition.good,
      newPrice: 900,
      negotiable: true,
      handover: HandoverMethod.delivery,
      note: 'A few pencil notes in chapter 2. Can send by courier.',
      category: 'Algorithms',
    ),
    seedListing(
      'p2p-4',
      'The Pragmatic Programmer',
      'p-nabila',
      440,
      BookCondition.good,
      status: P2pListingStatus.reserved,
      newPrice: 700,
      negotiable: true,
      category: 'Software Engineering',
    ),
    seedListing(
      'p2p-5',
      'Operating Systems',
      'p-talha',
      560,
      BookCondition.likeNew,
      status: P2pListingStatus.sold,
      newPrice: 800,
      negotiable: true,
      handover: HandoverMethod.delivery,
      category: 'Computer Science',
    ),
    seedListing(
      'p2p-6',
      'Digital Logic Design',
      'p-mahi',
      260,
      BookCondition.acceptable,
      newPrice: 400,
      note: 'Cover is worn, pages are fine.',
      category: 'Engineering',
    ),
    ...p2pMySeed,
    ...p2pReviewSeed,
    ...p2pHandledSeed,
  ];

  /// Who each reserved or sold listing went to.
  static const Map<String, String> buyers = {
    'p2p-2': 'p-rafi',
    'p2p-4': P2pPeople.me,
    'p2p-5': P2pPeople.me,
  };
}

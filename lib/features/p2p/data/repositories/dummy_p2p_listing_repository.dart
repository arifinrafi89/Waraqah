import '../../domain/models/p2p_listing.dart';
import '../../domain/repositories/p2p_listing_repository.dart';

class DummyP2pListingRepository implements P2pListingRepository {
  static const List<P2pListing> _listings = [
    P2pListing(
      id: 'p2p-1',
      sellerId: 'profile-1',
      bookId: 'book-4',
      condition: P2pCondition.good,
      price: 700,
      photoUrls: ['https://placehold.co/300x300?text=Clean+Code+Used'],
      status: P2pStatus.available,
    ),
    P2pListing(
      id: 'p2p-2',
      sellerId: 'profile-2',
      bookId: 'book-7',
      condition: P2pCondition.likeNew,
      price: 500,
      photoUrls: ['https://placehold.co/300x300?text=Thinking+Fast+Used'],
      status: P2pStatus.available,
    ),
    P2pListing(
      id: 'p2p-3',
      sellerId: 'profile-3',
      bookId: 'book-9',
      condition: P2pCondition.fair,
      price: 350,
      photoUrls: ['https://placehold.co/300x300?text=7+Habits+Used'],
      status: P2pStatus.reserved,
    ),
    P2pListing(
      id: 'p2p-4',
      sellerId: 'profile-4',
      bookId: 'book-11',
      condition: P2pCondition.good,
      price: 450,
      photoUrls: ['https://placehold.co/300x300?text=Brief+History+Used'],
      status: P2pStatus.available,
    ),
    P2pListing(
      id: 'p2p-5',
      sellerId: 'profile-5',
      bookId: 'book-1',
      condition: P2pCondition.likeNew,
      price: 480,
      photoUrls: ['https://placehold.co/300x300?text=Sapiens+Used'],
      status: P2pStatus.available,
    ),
    P2pListing(
      id: 'p2p-6',
      sellerId: 'profile-1',
      bookId: 'book-12',
      condition: P2pCondition.fair,
      price: 200,
      photoUrls: ['https://placehold.co/300x300?text=Gatsby+Used'],
      status: P2pStatus.sold,
    ),
    P2pListing(
      id: 'p2p-7',
      sellerId: 'profile-2',
      bookId: 'book-2',
      condition: P2pCondition.good,
      price: 400,
      photoUrls: ['https://placehold.co/300x300?text=Atomic+Habits+Used'],
      status: P2pStatus.available,
    ),
    P2pListing(
      id: 'p2p-8',
      sellerId: 'profile-3',
      bookId: 'book-8',
      condition: P2pCondition.likeNew,
      price: 420,
      photoUrls: ['https://placehold.co/300x300?text=Harry+Potter+Used'],
      status: P2pStatus.available,
    ),
  ];

  @override
  List<P2pListing> getListings() => List.unmodifiable(_listings);
}

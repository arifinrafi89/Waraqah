import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/features/home/data/repositories/dummy_book_repository.dart';
import 'package:waraqah/features/home/data/repositories/dummy_p2p_listing_repository.dart';
import 'package:waraqah/features/home/data/repositories/dummy_post_repository.dart';
import 'package:waraqah/features/home/data/repositories/dummy_profile_repository.dart';
import 'package:waraqah/features/home/domain/models/p2p_listing.dart';

void main() {
  group('DummyBookRepository', () {
    final repo = DummyBookRepository();

    test('returns enough books to fill a grid', () {
      expect(repo.getBooks().length, greaterThanOrEqualTo(8));
    });

    test('books have non-empty required fields', () {
      for (final book in repo.getBooks()) {
        expect(book.id, isNotEmpty);
        expect(book.title, isNotEmpty);
        expect(book.author, isNotEmpty);
        expect(book.isbn, isNotEmpty);
        expect(book.genre, isNotEmpty);
        expect(book.coverUrl, isNotEmpty);
        expect(book.currency, isNotEmpty);
        expect(book.price, greaterThan(0));
        expect(book.vendorName, isNotEmpty);
      }
    });
  });

  group('DummyPostRepository', () {
    final repo = DummyPostRepository();

    test('returns enough posts to fill the Book-Bites strip', () {
      expect(repo.getPosts().length, greaterThanOrEqualTo(8));
    });

    test('posts have non-empty required fields', () {
      for (final post in repo.getPosts()) {
        expect(post.id, isNotEmpty);
        expect(post.authorId, isNotEmpty);
        expect(post.content, isNotEmpty);
        expect(post.taggedBookIds, isNotEmpty);
      }
    });
  });

  group('DummyP2pListingRepository', () {
    final repo = DummyP2pListingRepository();

    test('returns enough listings to fill the P2P strip', () {
      expect(repo.getListings().length, greaterThanOrEqualTo(6));
    });

    test('listings have non-empty required fields', () {
      for (final listing in repo.getListings()) {
        expect(listing.id, isNotEmpty);
        expect(listing.sellerId, isNotEmpty);
        expect(listing.price, greaterThan(0));
        expect(listing.photoUrls, isNotEmpty);
        expect(P2pCondition.values, contains(listing.condition));
        expect(P2pStatus.values, contains(listing.status));
      }
    });
  });

  group('DummyProfileRepository', () {
    final repo = DummyProfileRepository();

    test('returns non-empty profiles', () {
      expect(repo.getProfiles(), isNotEmpty);
    });

    test('profiles have non-empty required fields', () {
      for (final profile in repo.getProfiles()) {
        expect(profile.id, isNotEmpty);
        expect(profile.fullName, isNotEmpty);
        expect(profile.university, isNotEmpty);
        expect(profile.studentId, isNotEmpty);
        expect(profile.avatarUrl, isNotEmpty);
      }
    });
  });
}

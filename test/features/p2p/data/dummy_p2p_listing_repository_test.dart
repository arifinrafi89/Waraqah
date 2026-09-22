import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/features/p2p/data/repositories/dummy_p2p_listing_repository.dart';
import 'package:waraqah/features/p2p/domain/models/p2p_listing.dart';

void main() {
  group('DummyP2pListingRepository', () {
    final repo = DummyP2pListingRepository();

    test('returns enough listings to fill the P2P strip', () async {
      expect((await repo.getListings()).length, greaterThanOrEqualTo(6));
    });

    test('listings have non-empty required fields', () async {
      for (final listing in await repo.getListings()) {
        expect(listing.id, isNotEmpty);
        expect(listing.sellerId, isNotEmpty);
        expect(listing.price, greaterThan(0));
        expect(listing.photoUrls, isNotEmpty);
        expect(P2pCondition.values, contains(listing.condition));
        expect(P2pStatus.values, contains(listing.status));
      }
    });
  });
}

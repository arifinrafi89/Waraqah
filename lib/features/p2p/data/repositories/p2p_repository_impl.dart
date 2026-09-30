import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../domain/repositories/p2p_repository.dart';
import '../sources/p2p_fixtures.dart';

class P2pRepositoryImpl implements P2pRepository {
  final TtlCache<List<P2pListing>> _cache = TtlCache(
    ttl: const Duration(minutes: 2),
  );

  @override
  Future<List<P2pListing>> fetchNearbyListings({int limit = 6}) =>
      _cache.resolve('nearby:$limit', () async {
        await Future<void>.delayed(const Duration(milliseconds: 850));
        return P2pFixtures.listings
            .where((l) => l.status == P2pListingStatus.live)
            .take(limit)
            .toList();
      });

  @override
  Future<List<P2pListing>> fetchMyListings() =>
      _cache.resolve('my_listings', () async {
        await Future<void>.delayed(const Duration(milliseconds: 600));
        // Return Farhan's items as dummy data
        return P2pFixtures.listings
            .where((l) => l.sellerName == 'Farhan')
            .toList();
      });
}

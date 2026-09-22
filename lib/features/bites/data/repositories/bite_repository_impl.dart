import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/bite.dart';
import '../../domain/repositories/bite_repository.dart';
import '../sources/bite_fixtures.dart';

/// Cached feed reader. Swaps to Dio once `GET /bites` ships from the Go repo.
class BiteRepositoryImpl implements BiteRepository {
  final TtlCache<List<Bite>> _cache = TtlCache(ttl: const Duration(minutes: 2));

  @override
  Future<List<Bite>> fetchFeed({int limit = 10}) =>
      _cache.resolve('feed:$limit', () async {
        await Future<void>.delayed(const Duration(milliseconds: 750));
        return BiteFixtures.feed.take(limit).toList();
      });
}

import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/ayah.dart';
import '../../domain/repositories/ayah_repository.dart';
import '../sources/ayah_fixtures.dart';

/// Cached for a full day, because the verse only changes at midnight.
class AyahRepositoryImpl implements AyahRepository {
  final TtlCache<Ayah> _cache = TtlCache(ttl: const Duration(hours: 24));

  @override
  Future<Ayah> fetchAyahOfTheDay() {
    final today = DateTime.now();
    final key = '${today.year}-${today.month}-${today.day}';
    return _cache.resolve(key, () async {
      await Future<void>.delayed(const Duration(milliseconds: 600));
      return AyahFixtures.forDate(today);
    });
  }
}

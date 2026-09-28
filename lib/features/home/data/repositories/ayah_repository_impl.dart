import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/ayah.dart';
import '../../domain/repositories/ayah_repository.dart';
import '../models/ayah_model.dart';
import '../sources/ayah_remote_source.dart';

/// Cached for a full day, because the verse only changes at midnight.
class AyahRepositoryImpl implements AyahRepository {
  AyahRepositoryImpl(this._source);

  final AyahRemoteSource _source;
  final TtlCache<Ayah> _cache = TtlCache(ttl: const Duration(hours: 24));

  @override
  Future<Ayah> fetchAyahOfTheDay() {
    final today = DateTime.now();
    final key = '${today.year}-${today.month}-${today.day}';
    return _cache.resolve(
      key,
      () async => (await _source.fetchAyahOfTheDay()).toEntity(),
    );
  }
}

import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/banner.dart';
import '../../domain/entities/season.dart';
import '../../domain/repositories/banner_repository.dart';
import '../models/banner_model.dart';
import '../models/season_model.dart';
import '../sources/banner_remote_source.dart';

/// Banners cached for a few minutes; Staff change them rarely. The Season
/// is read fresh: it's one small call.
class BannerRepositoryImpl implements BannerRepository {
  BannerRepositoryImpl(this._source);

  final BannerRemoteSource _source;
  final TtlCache<List<Banner>> _cache = TtlCache(
    ttl: const Duration(minutes: 10),
  );

  @override
  Future<List<Banner>> fetchBanners() => _cache.resolve(
    'all',
    () async => [for (final b in await _source.fetchBanners()) b.toEntity()],
  );

  @override
  Future<SeasonInfo?> fetchSeason() async =>
      (await _source.fetchSeason())?.toEntity();
}

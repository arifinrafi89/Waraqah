import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/deals.dart';
import '../../domain/repositories/deals_repository.dart';
import '../models/deals_model.dart';
import '../sources/deals_remote_source.dart';

/// Deals are the same for everyone and change rarely, so they're kept for
/// a minute after they load.
class DealsRepositoryImpl implements DealsRepository {
  DealsRepositoryImpl(this._source);

  final DealsRemoteSource _source;
  final _cache = TtlCache<Deals>(ttl: const Duration(minutes: 1));

  @override
  Future<Deals> current() =>
      _cache.resolve('deals', () async => (await _source.current()).toEntity());
}

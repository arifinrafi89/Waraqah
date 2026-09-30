import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/offers.dart';
import '../../domain/repositories/offers_repository.dart';
import '../models/offers_model.dart';
import '../sources/offers_remote_source.dart';

/// Offers are the same for everyone and change rarely, so they're kept for
/// a minute after they load.
class OffersRepositoryImpl implements OffersRepository {
  OffersRepositoryImpl(this._source);

  final OffersRemoteSource _source;
  final _cache = TtlCache<Offers>(ttl: const Duration(minutes: 1));

  @override
  Future<Offers> current() => _cache.resolve(
    'offers',
    () async => (await _source.current()).toEntity(),
  );
}

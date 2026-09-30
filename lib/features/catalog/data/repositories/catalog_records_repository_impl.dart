import '../../../../core/cache/ttl_cache.dart';
import '../../domain/entities/publisher.dart';
import '../../domain/repositories/catalog_records_repository.dart';
import '../sources/catalog_records_source.dart';

class CatalogRecordsRepositoryImpl implements CatalogRecordsRepository {
  CatalogRecordsRepositoryImpl(this._source);

  final CatalogRecordsSource _source;
  final _publishers = TtlCache<Publisher?>(ttl: const Duration(minutes: 30));

  @override
  Future<Publisher?> publisher(String id) =>
      _publishers.resolve(id, () => _source.publisher(id));
}

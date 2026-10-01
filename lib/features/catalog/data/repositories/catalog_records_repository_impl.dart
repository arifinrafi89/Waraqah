import '../../../../core/cache/ttl_cache.dart';
import '../../../../core/models/book.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/collection.dart';
import '../../domain/entities/publisher.dart';
import '../../domain/repositories/catalog_records_repository.dart';
import '../sources/catalog_records_source.dart';

class CatalogRecordsRepositoryImpl implements CatalogRecordsRepository {
  CatalogRecordsRepositoryImpl(this._source);

  final CatalogRecordsSource _source;
  final _categories = TtlCache<List<Category>>(
    ttl: const Duration(minutes: 30),
  );
  final _authors = TtlCache<Author?>(ttl: const Duration(minutes: 30));
  final _publishers = TtlCache<Publisher?>(ttl: const Duration(minutes: 30));
  final _collections = TtlCache<List<Collection>>(
    ttl: const Duration(minutes: 30),
  );
  final _collection = TtlCache<Collection?>(ttl: const Duration(minutes: 30));

  @override
  Future<List<Category>> categories(Section section) =>
      _categories.resolve(section.name, () => _source.categories(section));

  @override
  Future<Author?> author(String id) =>
      _authors.resolve(id, () => _source.author(id));

  @override
  Future<Publisher?> publisher(String id) =>
      _publishers.resolve(id, () => _source.publisher(id));

  @override
  Future<List<Collection>> collections(Section? section) => _collections
      .resolve(section?.name ?? '', () => _source.collections(section));

  @override
  Future<Collection?> collection(String id) =>
      _collection.resolve(id, () => _source.collection(id));
}

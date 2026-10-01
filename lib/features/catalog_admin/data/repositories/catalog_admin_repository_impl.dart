import '../../../../core/models/book.dart';
import '../../../home/domain/entities/banner.dart';
import '../../domain/entities/book_draft.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/repositories/catalog_admin_repository.dart';
import '../models/catalog_record_model.dart';
import '../sources/catalog_admin_remote_source.dart';

/// No cache: Staff want to see their change at once.
class CatalogAdminRepositoryImpl implements CatalogAdminRepository {
  CatalogAdminRepositoryImpl(this._source);

  final CatalogAdminRemoteSource _source;

  @override
  Future<Book> saveBook(BookDraft draft) => _source.saveBook(draft);

  @override
  Future<Book> setHidden(String bookId, {required bool hidden}) =>
      _source.setHidden(bookId, hidden);

  @override
  Future<List<CatalogRecord>> records(RecordKind kind) async => [
    for (final m in await _source.records(kind)) m.toEntity(),
  ];

  @override
  Future<CatalogRecord> saveRecord(
    RecordKind kind,
    CatalogRecord record,
  ) async => (await _source.saveRecord(kind, record)).toEntity();

  @override
  Future<void> deleteRecord(RecordKind kind, String id) =>
      _source.deleteRecord(kind, id);

  @override
  Future<void> saveBanner(Banner banner) => _source.saveBanner(banner);

  @override
  Future<void> deleteBanner(String id) => _source.deleteBanner(id);

  @override
  Future<void> moveBanner(String id, int by) => _source.moveBanner(id, by);
}

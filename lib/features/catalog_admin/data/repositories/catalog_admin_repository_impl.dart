import '../../../../core/models/book.dart';
import '../../../home/data/models/banner_model.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../home/domain/entities/season.dart';
import '../../domain/entities/book_draft.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/entities/isbn_lookup.dart';
import '../../domain/entities/list_draft.dart';
import '../../domain/entities/low_stock_edition.dart';
import '../../domain/repositories/catalog_admin_repository.dart';
import '../models/catalog_record_model.dart';
import '../sources/catalog_admin_remote_source.dart';
import '../sources/catalog_tools_remote_source.dart';

/// No cache: Staff want to see their change at once.
class CatalogAdminRepositoryImpl implements CatalogAdminRepository {
  CatalogAdminRepositoryImpl(this._source, this._tools);

  final CatalogAdminRemoteSource _source;
  final CatalogToolsRemoteSource _tools;

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
  Future<List<Banner>> banners() async => [
    for (final b in await _source.banners()) b.toEntity(),
  ];

  @override
  Future<Season?> seasonOverride() => _source.seasonOverride();

  @override
  Future<void> setSeasonOverride(Season? season) =>
      _source.setSeasonOverride(season);

  @override
  Future<void> saveBanner(Banner banner) => _source.saveBanner(banner);

  @override
  Future<void> deleteBanner(String id) => _source.deleteBanner(id);

  @override
  Future<void> moveBanner(String id, int by) => _source.moveBanner(id, by);

  @override
  Future<void> saveList(ListDraft draft) => _source.saveList(draft);

  @override
  Future<void> deleteList(String id, {required bool booklist}) =>
      _source.deleteList(id, booklist: booklist);

  @override
  Future<IsbnLookup?> lookUpIsbn(String isbn) => _tools.lookUpIsbn(isbn);

  @override
  Future<List<LowStockEdition>> lowStock() => _tools.lowStock();

  @override
  Future<void> setEditionStock(String editionId, int stock) =>
      _tools.setStock(editionId, stock);
}

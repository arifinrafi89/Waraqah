import '../../../../core/models/book.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../home/domain/entities/season.dart';
import '../entities/book_draft.dart';
import '../entities/catalog_record.dart';

/// Staff's changes to the catalog. A refused change throws.
abstract interface class CatalogAdminRepository {
  /// The saved Book, with the id, Edition ids and Author name the server set.
  Future<Book> saveBook(BookDraft draft);

  Future<Book> setHidden(String bookId, {required bool hidden});

  /// Every Category, Author or Publisher, with how many Books use it.
  Future<List<CatalogRecord>> records(RecordKind kind);

  Future<CatalogRecord> saveRecord(RecordKind kind, CatalogRecord record);

  /// Refused while a Book uses it.
  Future<void> deleteRecord(RecordKind kind, String id);

  /// Every Banner, every Season's too, in display order.
  Future<List<Banner>> banners();

  /// The Season Staff forced on Home; `null` = picked by date.
  Future<Season?> seasonOverride();

  Future<void> setSeasonOverride(Season? season);

  Future<void> saveBanner(Banner banner);

  Future<void> deleteBanner(String id);

  /// Moves a Banner one place up ([by] = -1) or down (1).
  Future<void> moveBanner(String id, int by);
}

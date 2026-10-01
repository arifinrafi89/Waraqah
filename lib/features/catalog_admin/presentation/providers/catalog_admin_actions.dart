import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/domain/entities/banner.dart';
import '../../../home/domain/entities/season.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/repositories/catalog_admin_repository.dart';
import '../../domain/usecases/delete_banner.dart';
import '../../domain/usecases/delete_record.dart';
import '../../domain/usecases/move_banner.dart';
import '../../domain/usecases/save_banner.dart';
import '../../domain/usecases/save_record.dart';
import '../../domain/usecases/season_override.dart';
import 'catalog_admin_providers.dart';

/// Staff's changes to Categories, Authors, Publishers, Banners and Home's
/// Season. Each
/// refreshes the catalog after, so the whole app sees it.
class CatalogAdminActions {
  CatalogAdminActions(this._ref);

  final Ref _ref;

  CatalogAdminRepository get _repository =>
      _ref.read(catalogAdminRepositoryProvider);

  Future<CatalogRecord> saveRecord(RecordKind kind, CatalogRecord record) =>
      _refreshAfter(SaveRecord(_repository)((kind, record)));

  Future<void> deleteRecord(RecordKind kind, String id) =>
      _refreshAfter(DeleteRecord(_repository)((kind, id)));

  Future<void> saveBanner(Banner banner) =>
      _refreshAfter(SaveBanner(_repository)(banner));

  Future<void> deleteBanner(String id) =>
      _refreshAfter(DeleteBanner(_repository)(id));

  Future<void> moveBanner(String id, int by) =>
      _refreshAfter(MoveBanner(_repository)((id, by)));

  /// Forces [season] on Home, or `null` to pick it by date again.
  Future<void> setSeason(Season? season) =>
      _refreshAfter(SetSeasonOverride(_repository)(season));

  Future<T> _refreshAfter<T>(Future<T> change) async {
    final result = await change;
    refreshCatalog(_ref);
    return result;
  }
}

final catalogAdminActionsProvider = Provider<CatalogAdminActions>(
  CatalogAdminActions.new,
);

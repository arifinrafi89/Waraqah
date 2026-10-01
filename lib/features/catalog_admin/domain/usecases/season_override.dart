import '../../../../core/usecase/usecase.dart';
import '../../../home/domain/entities/season.dart';
import '../repositories/catalog_admin_repository.dart';

/// The Season Staff forced on Home; `null` = picked by date.
class GetSeasonOverride extends UseCase<Season?, NoParams> {
  GetSeasonOverride(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<Season?> call(NoParams params) => _repository.seasonOverride();
}

/// Forces a Season on Home, or `null` to go back to picking by date.
class SetSeasonOverride extends UseCase<void, Season?> {
  SetSeasonOverride(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call(Season? params) => _repository.setSeasonOverride(params);
}

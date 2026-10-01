import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';

/// Moves a Banner one place up (-1) or down (1) on Home.
class MoveBanner extends UseCase<void, (String, int)> {
  MoveBanner(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call((String, int) params) =>
      _repository.moveBanner(params.$1, params.$2);
}

import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';

/// Sets one printed Edition's stock: `(editionId, stock)`.
class SetEditionStock extends UseCase<void, (String, int)> {
  SetEditionStock(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call((String, int) params) =>
      _repository.setEditionStock(params.$1, params.$2);
}

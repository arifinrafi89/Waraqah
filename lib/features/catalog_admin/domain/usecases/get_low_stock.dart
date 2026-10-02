import '../../../../core/usecase/usecase.dart';
import '../entities/low_stock_edition.dart';
import '../repositories/catalog_admin_repository.dart';

/// Printed Editions at or under `CatalogAdminRules.lowStock`, lowest first.
class GetLowStock extends UseCase<List<LowStockEdition>, NoParams> {
  GetLowStock(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<List<LowStockEdition>> call(NoParams params) => _repository.lowStock();
}

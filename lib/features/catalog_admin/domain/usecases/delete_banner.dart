import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';

/// Deletes a Banner from Home.
class DeleteBanner extends UseCase<void, String> {
  DeleteBanner(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call(String params) => _repository.deleteBanner(params);
}

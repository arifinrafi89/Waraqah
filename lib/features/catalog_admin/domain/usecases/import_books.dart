import '../../../../core/usecase/usecase.dart';
import '../entities/import_book.dart';
import '../repositories/catalog_admin_repository.dart';

/// Adds the Books of a checked CSV paste. The server checks each again.
class ImportBooks extends UseCase<ImportResult, List<ImportBook>> {
  ImportBooks(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<ImportResult> call(List<ImportBook> params) =>
      _repository.importBooks(params);
}

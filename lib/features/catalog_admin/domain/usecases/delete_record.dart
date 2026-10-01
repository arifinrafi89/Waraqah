import '../entities/catalog_record.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';

/// Deletes a Category, Author or Publisher no Book uses.
class DeleteRecord extends UseCase<void, (RecordKind, String)> {
  DeleteRecord(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call((RecordKind, String) params) =>
      _repository.deleteRecord(params.$1, params.$2);
}

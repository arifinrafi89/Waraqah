import '../entities/catalog_record.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';

/// Every Category, Author or Publisher, with how many Books use it.
class GetAdminRecords extends UseCase<List<CatalogRecord>, RecordKind> {
  GetAdminRecords(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<List<CatalogRecord>> call(RecordKind params) =>
      _repository.records(params);
}

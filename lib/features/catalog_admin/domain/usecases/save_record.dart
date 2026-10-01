import '../../../../core/usecase/usecase.dart';
import '../entities/catalog_admin_rules.dart';
import '../entities/catalog_record.dart';
import '../repositories/catalog_admin_repository.dart';

/// Adds or renames a Category, Author or Publisher. Renaming an Author
/// renames it on every one of their Books.
class SaveRecord extends UseCase<CatalogRecord, (RecordKind, CatalogRecord)> {
  SaveRecord(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<CatalogRecord> call((RecordKind, CatalogRecord) params) {
    final (kind, record) = params;
    final problems = CatalogAdminRules.record(kind, record);
    if (problems.isNotEmpty) {
      throw ArgumentError.value(record, 'record', problems.first.name);
    }
    return _repository.saveRecord(kind, record);
  }
}

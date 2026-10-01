import '../../../../core/usecase/usecase.dart';
import '../entities/isbn_lookup.dart';
import '../repositories/catalog_admin_repository.dart';

/// What an ISBN-13 is: a Book in the catalog, one from outside to fill the
/// form with, or `null` when nobody knows it.
class LookUpIsbn extends UseCase<IsbnLookup?, String> {
  LookUpIsbn(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<IsbnLookup?> call(String params) => _repository.lookUpIsbn(params);
}

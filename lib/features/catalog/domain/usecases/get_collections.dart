import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/collection.dart';
import '../repositories/catalog_records_repository.dart';

/// Every Collection, or only one Section's when given. `hasExpert`: only
/// Expert Picks when true, none when false.
class GetCollections
    extends UseCase<List<Collection>, ({Section? section, bool? hasExpert})> {
  GetCollections(this._repository);

  final CatalogRecordsRepository _repository;

  @override
  Future<List<Collection>> call(({Section? section, bool? hasExpert}) params) =>
      _repository.collections(params.section, hasExpert: params.hasExpert);
}

/// One Collection with its books in order, or `null`.
class GetCollection extends UseCase<Collection?, String> {
  GetCollection(this._repository);

  final CatalogRecordsRepository _repository;

  @override
  Future<Collection?> call(String params) => _repository.collection(params);
}

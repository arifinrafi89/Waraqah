import '../../../../core/usecase/usecase.dart';
import '../entities/expert.dart';
import '../repositories/catalog_records_repository.dart';

/// One Expert with their Expert Picks, or `null`.
class GetExpert extends UseCase<ExpertDetail?, String> {
  GetExpert(this._repository);

  final CatalogRecordsRepository _repository;

  @override
  Future<ExpertDetail?> call(String params) => _repository.expert(params);
}

/// Every Expert, for Staff picking who made a Collection.
class GetExperts extends UseCase<List<Expert>, NoParams> {
  GetExperts(this._repository);

  final CatalogRecordsRepository _repository;

  @override
  Future<List<Expert>> call(NoParams params) => _repository.experts();
}

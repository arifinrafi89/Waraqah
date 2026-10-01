import '../../../../core/usecase/usecase.dart';
import '../entities/used_options.dart';
import '../repositories/used_options_repository.dart';

/// A book's Certified Used copy and resale value.
class GetUsedOptions extends UseCase<UsedOptions, String> {
  GetUsedOptions(this._repository);

  final UsedOptionsRepository _repository;

  @override
  Future<UsedOptions> call(String params) => _repository.forBook(params);
}

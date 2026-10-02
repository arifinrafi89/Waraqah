import '../../../../core/usecase/usecase.dart';
import '../entities/saved_address.dart';
import '../repositories/profile_repository.dart';

/// Makes one address the one checkout preselects.
class SetDefaultAddress extends UseCase<List<SavedAddress>, String> {
  SetDefaultAddress(this._repository);

  final ProfileRepository _repository;

  @override
  Future<List<SavedAddress>> call(String params) =>
      _repository.setDefaultAddress(params);
}

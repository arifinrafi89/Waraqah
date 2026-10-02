import '../../../../core/usecase/usecase.dart';
import '../entities/saved_address.dart';
import '../repositories/profile_repository.dart';

/// Deleting the default makes the next address the default.
class DeleteAddress extends UseCase<List<SavedAddress>, String> {
  DeleteAddress(this._repository);

  final ProfileRepository _repository;

  @override
  Future<List<SavedAddress>> call(String params) =>
      _repository.deleteAddress(params);
}

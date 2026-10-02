import '../../../../core/usecase/usecase.dart';
import '../repositories/profile_repository.dart';

/// Ends the account on the server. The caller signs out after.
class DeleteAccount extends UseCase<void, NoParams> {
  DeleteAccount(this._repository);

  final ProfileRepository _repository;

  @override
  Future<void> call(NoParams params) => _repository.deleteAccount();
}

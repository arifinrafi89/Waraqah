import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  SignOut(this._repository);

  final AuthRepository _repository;

  @override
  Future<void> call(NoParams params) => _repository.signOut();
}

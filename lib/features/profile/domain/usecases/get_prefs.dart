import '../../../../core/usecase/usecase.dart';
import '../entities/profile_prefs.dart';
import '../repositories/profile_repository.dart';

class GetPrefs extends UseCase<ProfilePrefs, NoParams> {
  GetPrefs(this._repository);

  final ProfileRepository _repository;

  @override
  Future<ProfilePrefs> call(NoParams params) => _repository.prefs();
}

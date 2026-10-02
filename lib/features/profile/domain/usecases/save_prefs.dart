import '../../../../core/usecase/usecase.dart';
import '../entities/profile_prefs.dart';
import '../repositories/profile_repository.dart';

class SavePrefs extends UseCase<ProfilePrefs, ProfilePrefs> {
  SavePrefs(this._repository);

  final ProfileRepository _repository;

  @override
  Future<ProfilePrefs> call(ProfilePrefs params) =>
      _repository.savePrefs(params);
}

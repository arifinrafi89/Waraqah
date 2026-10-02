import '../../../../core/usecase/usecase.dart';
import '../entities/profile_details.dart';
import '../entities/profile_rules.dart';
import '../repositories/profile_repository.dart';

/// Saves the profile with a trimmed name and the phone as `01…`. Throws a
/// [ProfileProblem] when it breaks [ProfileRules].
class SaveProfile extends UseCase<ProfileDetails, ProfileDetails> {
  SaveProfile(this._repository);

  final ProfileRepository _repository;

  @override
  Future<ProfileDetails> call(ProfileDetails params) {
    final problem = ProfileRules.check(params.name, params.phone);
    if (problem != null) throw problem;
    return _repository.saveProfile(
      params.copyWith(
        name: params.name.trim(),
        phone: ProfileRules.mobile(params.phone) ?? '',
      ),
    );
  }
}

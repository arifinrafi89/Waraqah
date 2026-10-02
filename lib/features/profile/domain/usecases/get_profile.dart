import '../../../../core/usecase/usecase.dart';
import '../entities/profile_details.dart';
import '../repositories/profile_repository.dart';

class GetProfile extends UseCase<ProfileDetails, NoParams> {
  GetProfile(this._repository);

  final ProfileRepository _repository;

  @override
  Future<ProfileDetails> call(NoParams params) => _repository.profile();
}

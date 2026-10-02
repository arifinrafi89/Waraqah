import '../../domain/entities/profile_details.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/profile_details_model.dart';
import '../sources/profile_remote_source.dart';

/// No cache: every page shows what the server has now.
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._source);

  final ProfileRemoteSource _source;

  @override
  Future<ProfileDetails> profile() async =>
      (await _source.profile()).toEntity();

  @override
  Future<ProfileDetails> saveProfile(ProfileDetails details) async =>
      (await _source.saveProfile(ProfileDetailsModel.fromEntity(details)))
          .toEntity();
}

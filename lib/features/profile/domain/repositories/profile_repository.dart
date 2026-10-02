import '../entities/profile_details.dart';

/// The signed-in Reader's profile.
abstract interface class ProfileRepository {
  Future<ProfileDetails> profile();

  /// Answers what the server saved.
  Future<ProfileDetails> saveProfile(ProfileDetails details);
}

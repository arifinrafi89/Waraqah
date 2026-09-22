import '../models/profile.dart';

abstract class ProfileRepository {
  Future<List<Profile>> getProfiles();
}

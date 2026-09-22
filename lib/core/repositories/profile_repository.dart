import '../models/profile.dart';

abstract class ProfileRepository {
  List<Profile> getProfiles();
}

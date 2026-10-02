import '../entities/geo.dart';
import '../entities/profile_details.dart';
import '../entities/profile_prefs.dart';
import '../entities/saved_address.dart';

/// The signed-in Reader's profile, settings and saved addresses. Address changes
/// answer the whole list, default first.
abstract interface class ProfileRepository {
  Future<ProfileDetails> profile();

  /// Answers what the server saved.
  Future<ProfileDetails> saveProfile(ProfileDetails details);

  Future<List<SavedAddress>> addresses();

  /// Adds [address] when its id is empty, otherwise replaces it.
  Future<List<SavedAddress>> saveAddress(SavedAddress address);

  Future<List<SavedAddress>> deleteAddress(String id);

  Future<List<SavedAddress>> setDefaultAddress(String id);

  Future<ProfilePrefs> prefs();

  /// Answers what the server saved.
  Future<ProfilePrefs> savePrefs(ProfilePrefs prefs);

  /// Ends the account on the server; the app signs out after.
  Future<void> deleteAccount();

  /// Every division, district and upazila. Doesn't change while the app
  /// runs.
  Future<List<GeoDivision>> geo();
}

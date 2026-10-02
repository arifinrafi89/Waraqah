import '../../domain/entities/profile_rules.dart';
import '../models/profile_details_model.dart';
import '../models/profile_prefs_model.dart';

/// The signed-in Reader's ("me") profile and settings, as the fake backend
/// keeps them. Notifications ask [prefs] which groups are muted.
class ProfileFakeStore {
  ProfileDetailsModel details = const ProfileDetailsModel();
  ProfilePrefsModel prefs = const ProfilePrefsModel();

  /// The saved profile, or `null` when it breaks [ProfileRules].
  ProfileDetailsModel? save(ProfileDetailsModel next) {
    if (ProfileRules.check(next.name, next.phone) != null) return null;
    return details = next.copyWith(
      name: next.name.trim(),
      phone: ProfileRules.mobile(next.phone) ?? '',
    );
  }
}

import '../../domain/entities/profile_rules.dart';
import '../models/profile_details_model.dart';

/// The signed-in Reader's ("me") profile, as the fake backend keeps it.
class ProfileFakeStore {
  ProfileDetailsModel details = const ProfileDetailsModel();

  /// The saved profile, or `null` when it breaks [ProfileRules].
  ProfileDetailsModel? save(ProfileDetailsModel next) {
    if (ProfileRules.check(next.name, next.phone) != null) return null;
    return details = next.copyWith(
      name: next.name.trim(),
      phone: ProfileRules.mobile(next.phone) ?? '',
    );
  }
}

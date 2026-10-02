import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/profile_rules.dart';

/// What each [ProfileProblem] says to the Reader.
extension ProfileProblemText on ProfileProblem {
  String message(AppL10n l10n) => switch (this) {
    ProfileProblem.nameLength => l10n.profileNameLength(
      ProfileRules.minName,
      ProfileRules.maxName,
    ),
    ProfileProblem.phone => l10n.profilePhoneInvalid,
  };
}

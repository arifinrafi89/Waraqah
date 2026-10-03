import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/auth_failure.dart';

/// What each auth failure says to the Reader.
extension AuthFailureText on AuthFailure {
  String message(AppL10n l10n) => switch (this) {
    AuthFailure.invalidEmail => l10n.authInvalidEmail,
    AuthFailure.missingPassword => l10n.authMissingPassword,
    AuthFailure.wrongCode => l10n.authWrongCode,
    AuthFailure.wrongCredentials => l10n.authWrongCredentials,
    AuthFailure.googleFailed => l10n.authGoogleFailed,
    AuthFailure.signUpRefused => l10n.authSignUpRefused,
  };
}

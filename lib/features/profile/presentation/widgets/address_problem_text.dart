import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/address_rules.dart';

/// What each [AddressProblem] says to the Reader.
extension AddressProblemText on AddressProblem {
  String message(AppL10n l10n) => switch (this) {
    AddressProblem.label => l10n.profileAddressLabelMissing,
    AddressProblem.recipient => l10n.profileRecipientMissing,
    AddressProblem.phone => l10n.profilePhoneInvalid,
    AddressProblem.line => l10n.profileAddressLineMissing,
    AddressProblem.place => l10n.profileAddressPlaceMissing,
  };
}

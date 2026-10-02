import 'profile_rules.dart';
import 'saved_address.dart';

/// Why an address can't be saved.
enum AddressProblem implements Exception {
  label,
  recipient,
  phone,
  line,
  place,
}

/// What a saved address must have. The editor shows these, and the server
/// refuses a save that breaks one.
abstract final class AddressRules {
  /// The first problem with [address], in the editor's field order.
  static AddressProblem? check(SavedAddress address) {
    if (address.label.trim().isEmpty) return AddressProblem.label;
    if (address.recipient.trim().isEmpty) return AddressProblem.recipient;
    if (ProfileRules.mobile(address.phone) == null) return AddressProblem.phone;
    if (address.line.trim().isEmpty) return AddressProblem.line;
    if (address.division.isEmpty ||
        address.district.isEmpty ||
        address.upazila.isEmpty) {
      return AddressProblem.place;
    }
    return null;
  }

  /// [address] trimmed, with its phone as `01…`. Call after [check].
  static SavedAddress tidy(SavedAddress address) => address.copyWith(
    label: address.label.trim(),
    recipient: address.recipient.trim(),
    line: address.line.trim(),
    phone: ProfileRules.mobile(address.phone) ?? address.phone,
  );
}

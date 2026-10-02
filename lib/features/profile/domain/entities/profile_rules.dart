/// Why a profile can't be saved.
enum ProfileProblem implements Exception { nameLength, phone }

/// What a profile must look like. The form shows these, and the server
/// refuses a save that breaks one.
abstract final class ProfileRules {
  static const int minName = 2;
  static const int maxName = 60;

  static final RegExp _bdMobile = RegExp(r'^(?:\+?880|0)(1[3-9]\d{8})$');

  /// [raw] as `01…` when it's a Bangladesh mobile number (`01…`, `+880…` or
  /// `880…`), otherwise `null`.
  static String? mobile(String raw) {
    final match = _bdMobile.firstMatch(raw.replaceAll(RegExp(r'[\s-]'), ''));
    return match == null ? null : '0${match[1]}';
  }

  /// The first problem with [name] and [phone] (which may be blank).
  static ProfileProblem? check(String name, String phone) {
    final length = name.trim().length;
    if (length < minName || length > maxName) return ProfileProblem.nameLength;
    if (phone.trim().isNotEmpty && mobile(phone) == null) {
      return ProfileProblem.phone;
    }
    return null;
  }
}

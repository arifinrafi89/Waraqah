/// Demo accounts for the fake API.
///
/// The staff emails below sign in with their role; any other email signs in
/// as a reader. Passwords are not checked until the Go backend exists.
abstract final class AuthFixtures {
  /// The only one-time code the fake API accepts.
  static const String demoOtp = '123456';

  static const Map<String, (String, String)> _staff = {
    'admin@waraqah.test': ('Waraqah Admin', 'superAdmin'),
    'moderator@waraqah.test': ('Waraqah Moderator', 'moderator'),
    'catalog@waraqah.test': ('Catalog Manager', 'catalogManager'),
    'support@waraqah.test': ('Waraqah Support', 'support'),
  };

  /// The account the fake API returns for [email].
  static Map<String, dynamic> accountFor(String email) {
    final staff = _staff[email];
    return {
      'id': 'user-$email',
      'name': staff?.$1 ?? _nameFrom(email),
      'email': email,
      'role': staff?.$2 ?? 'reader',
    };
  }

  /// A new Reader from a sign-up. A phone sign-up uses the number as its
  /// email until `AppUser` has a phone field.
  static Map<String, dynamic> signUp(String contact, String name) => {
    'id': 'user-$contact',
    'name': name.isEmpty ? _nameFrom(contact) : name,
    'email': contact,
    'role': 'reader',
  };

  static String _nameFrom(String email) {
    final local = email.split('@').first;
    if (local.isEmpty) return 'Reader';
    return local[0].toUpperCase() + local.substring(1);
  }
}

import '../entities/app_user.dart';

/// Signing in and out, and remembering who is signed in between launches.
abstract interface class AuthRepository {
  /// The account saved from the last sign-in, or `null` for a guest.
  AppUser? savedUser();

  Future<AppUser> signIn({required String email, required String password});

  Future<void> signOut();

  /// Saves a new display name on the device's session, after the profile
  /// saved it on the server. `null` for a guest.
  Future<AppUser?> rename(String name);
}

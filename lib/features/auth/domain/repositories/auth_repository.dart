import '../entities/app_user.dart';

/// Signing in and out, and remembering who is signed in between launches.
abstract interface class AuthRepository {
  /// The account saved from the last sign-in, or `null` for a guest.
  AppUser? savedUser();

  Future<AppUser> signIn({required String email, required String password});

  Future<void> signOut();
}

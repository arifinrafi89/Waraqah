import '../entities/user_session.dart';

/// Abstract repository interface defining authentication contracts.
abstract class AuthRepository {
  /// Signs in a user using email and password credentials.
  Future<UserSession> signInWithEmail({
    required String email,
    required String password,
  });

  /// Signs up a new user with email, password, and optional full name.
  Future<UserSession> signUpWithEmail({
    required String email,
    required String password,
    String? fullName,
  });

  /// Signs out the currently authenticated user.
  Future<void> signOut();

  /// Retrieves the current user session if valid, null otherwise.
  Future<UserSession?> getCurrentSession();

  /// Stream of user session state changes.
  Stream<UserSession?> watchAuthState();
}


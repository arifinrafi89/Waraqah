import '../entities/app_user.dart';

abstract interface class AuthFlowRepository {
  Future<AppUser> signInWithGoogle();

  Future<void> requestSignUpOtp({
    required String name,
    required String contact,
    required String password,
  });

  Future<AppUser> verifySignUpOtp({
    required String contact,
    required String otp,
  });

  Future<void> requestPasswordReset(String contact);

  Future<void> resetPassword({
    required String contact,
    required String otp,
    required String password,
  });
}

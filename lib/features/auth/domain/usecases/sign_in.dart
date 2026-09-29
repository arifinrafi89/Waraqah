import '../../../../core/usecase/usecase.dart';
import '../entities/app_user.dart';
import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';

class SignInParams {
  const SignInParams({required this.email, required this.password});

  final String email;
  final String password;
}

/// Checks the input, then signs in. Throws [AuthFailure] for bad input.
class SignIn extends UseCase<AppUser, SignInParams> {
  SignIn(this._repository);

  final AuthRepository _repository;

  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  Future<AppUser> call(SignInParams params) async {
    final email = params.email.trim().toLowerCase();
    if (!_emailPattern.hasMatch(email)) throw AuthFailure.invalidEmail;
    if (params.password.isEmpty) throw AuthFailure.missingPassword;
    return _repository.signIn(email: email, password: params.password);
  }
}

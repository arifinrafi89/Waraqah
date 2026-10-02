import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/auth_flow_repository.dart';
import '../models/app_user_model.dart';
import '../sources/auth_remote_source.dart';
import '../sources/session_store.dart';

/// Signs in through the API and keeps the account on the device.
class AuthRepositoryImpl implements AuthRepository, AuthFlowRepository {
  AuthRepositoryImpl(this._source, this._store);

  final AuthRemoteSource _source;
  final SessionStore _store;

  @override
  AppUser? savedUser() => _store.read()?.toEntity();

  @override
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    final user = await _source.signIn(email: email, password: password);
    await _store.write(user);
    return user.toEntity();
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    final user = await _source.signInWithGoogle();
    await _store.write(user);
    return user.toEntity();
  }

  @override
  Future<void> requestSignUpOtp({
    required String name,
    required String contact,
    required String password,
  }) => _source.requestSignUpOtp(
    name: name,
    contact: contact,
    password: password,
  );

  @override
  Future<AppUser> verifySignUpOtp({
    required String contact,
    required String otp,
  }) async {
    final user = await _source.verifySignUpOtp(contact: contact, otp: otp);
    await _store.write(user);
    return user.toEntity();
  }

  @override
  Future<void> requestPasswordReset(String contact) =>
      _source.requestPasswordReset(contact);

  @override
  Future<void> resetPassword({
    required String contact,
    required String otp,
    required String password,
  }) => _source.resetPassword(contact: contact, otp: otp, password: password);

  @override
  Future<void> signOut() => _store.clear();

  @override
  Future<AppUser?> rename(String name) async {
    final user = _store.read()?.copyWith(name: name);
    if (user != null) await _store.write(user);
    return user?.toEntity();
  }
}

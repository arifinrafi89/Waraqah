import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/app_user_model.dart';
import '../sources/auth_remote_source.dart';
import '../sources/session_store.dart';

/// Signs in through the API and keeps the account on the device.
class AuthRepositoryImpl implements AuthRepository {
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
  Future<void> signOut() => _store.clear();
}

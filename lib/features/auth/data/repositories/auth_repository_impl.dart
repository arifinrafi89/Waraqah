import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/supabase_client.dart';
import '../../domain/entities/user_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return AuthRemoteDatasourceImpl(supabase);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDatasource = ref.watch(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(remoteDatasource);
});

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<UserSession> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _remoteDatasource.signIn(email: email, password: password);
    } on AuthException catch (e) {
      throw AuthFailure(e.message, e.statusCode);
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<UserSession> signUpWithEmail({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      return await _remoteDatasource.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );
    } on AuthException catch (e) {
      throw AuthFailure(e.message, e.statusCode);
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _remoteDatasource.signOut();
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<UserSession?> getCurrentSession() async {
    try {
      return await _remoteDatasource.getCurrentSession();
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Stream<UserSession?> watchAuthState() {
    return _remoteDatasource.watchAuthState();
  }
}


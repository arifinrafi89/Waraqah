import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import '../../../../core/domain/entities/user_profile.dart';
import '../../../../core/errors/exceptions.dart' as app_err;
import '../../domain/entities/user_session.dart';
import '../models/user_dto.dart';

abstract class AuthRemoteDatasource {
  Future<UserSession> signIn({required String email, required String password});
  Future<UserSession> signUp({
    required String email,
    required String password,
    String? fullName,
  });
  Future<void> signOut();
  Future<UserSession?> getCurrentSession();
  Stream<UserSession?> watchAuthState();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final supa.SupabaseClient _supabase;

  AuthRemoteDatasourceImpl(this._supabase);

  @override
  Future<UserSession> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final session = response.session;
      final user = response.user;
      if (session == null || user == null) {
        throw const app_err.AuthException('Failed to obtain user session.');
      }
      final profile = await _fetchUserProfile(user);
      return _buildSession(session, profile);
    } on supa.AuthException catch (e) {
      throw app_err.AuthException(e.message, int.tryParse(e.statusCode ?? ''));
    } catch (e) {
      if (e is app_err.AppException) rethrow;
      throw app_err.ServerException(e.toString());
    }
  }

  @override
  Future<UserSession> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: fullName != null ? {'full_name': fullName} : null,
      );
      final session = response.session;
      final user = response.user;
      if (user == null) {
        throw const app_err.AuthException('Failed to create account.');
      }

      // In case email confirmation is required and session is temporarily null
      final profile = UserProfile(
        id: user.id,
        email: user.email ?? email,
        fullName: fullName ?? user.userMetadata?['full_name'] as String?,
        role: 'user',
        createdAt: DateTime.now(),
      );

      return UserSession(
        user: profile,
        accessToken: session?.accessToken ?? '',
        refreshToken: session?.refreshToken,
      );
    } on supa.AuthException catch (e) {
      throw app_err.AuthException(e.message, int.tryParse(e.statusCode ?? ''));
    } catch (e) {
      if (e is app_err.AppException) rethrow;
      throw app_err.ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw app_err.ServerException(e.toString());
    }
  }

  @override
  Future<UserSession?> getCurrentSession() async {
    final session = _supabase.auth.currentSession;
    final user = _supabase.auth.currentUser;
    if (session == null || user == null) return null;
    final profile = await _fetchUserProfile(user);
    return _buildSession(session, profile);
  }

  @override
  Stream<UserSession?> watchAuthState() {
    return _supabase.auth.onAuthStateChange.asyncMap((data) async {
      final session = data.session;
      if (session == null) return null;
      final user = session.user;
      final profile = await _fetchUserProfile(user);
      return _buildSession(session, profile);
    });
  }

  Future<UserProfile> _fetchUserProfile(supa.User user) async {
    try {
      final res = await _supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (res != null) {
        return UserDto.fromJson(res).toDomain();
      }
    } catch (_) {
      // Fallback if users table row not yet created
    }

    return UserProfile(
      id: user.id,
      email: user.email ?? '',
      fullName: user.userMetadata?['full_name'] as String?,
      avatarUrl: user.userMetadata?['avatar_url'] as String?,
      phone: user.phone,
      role: (user.userMetadata?['role'] as String?) ?? 'user',
    );
  }

  UserSession _buildSession(supa.Session session, UserProfile profile) {
    return UserSession(
      user: profile,
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
      expiresAt: session.expiresAt != null
          ? DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000)
          : null,
    );
  }
}


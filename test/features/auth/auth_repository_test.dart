import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/domain/entities/user_profile.dart';
import 'package:waraqah/core/errors/exceptions.dart';
import 'package:waraqah/core/errors/failures.dart';
import 'package:waraqah/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:waraqah/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:waraqah/features/auth/domain/entities/user_session.dart';

class FakeAuthRemoteDatasource implements AuthRemoteDatasource {
  UserSession? currentSession;
  final _controller = StreamController<UserSession?>.broadcast();

  @override
  Future<UserSession> signIn({required String email, required String password}) async {
    if (password == 'wrong_password') {
      throw const AuthException('Invalid login credentials', 400);
    }
    final session = UserSession(
      user: UserProfile(id: '123', email: email, fullName: 'Test User'),
      accessToken: 'token_xyz',
    );
    currentSession = session;
    _controller.add(session);
    return session;
  }

  @override
  Future<UserSession> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    final session = UserSession(
      user: UserProfile(id: '123', email: email, fullName: fullName),
      accessToken: 'token_xyz',
    );
    currentSession = session;
    _controller.add(session);
    return session;
  }

  @override
  Future<void> signOut() async {
    currentSession = null;
    _controller.add(null);
  }

  @override
  Future<UserSession?> getCurrentSession() async => currentSession;

  @override
  Stream<UserSession?> watchAuthState() => _controller.stream;
}

void main() {
  late FakeAuthRemoteDatasource fakeDatasource;
  late AuthRepositoryImpl repository;

  setUp(() {
    fakeDatasource = FakeAuthRemoteDatasource();
    repository = AuthRepositoryImpl(fakeDatasource);
  });

  test('signInWithEmail returns UserSession on valid credentials', () async {
    final session = await repository.signInWithEmail(
      email: 'test@example.com',
      password: 'password123',
    );

    expect(session.user.email, 'test@example.com');
    expect(session.accessToken, 'token_xyz');
  });

  test('signInWithEmail throws AuthFailure on invalid credentials', () async {
    expect(
      () => repository.signInWithEmail(
        email: 'test@example.com',
        password: 'wrong_password',
      ),
      throwsA(isA<AuthFailure>()),
    );
  });

  test('signOut clears the session', () async {
    await repository.signInWithEmail(
      email: 'test@example.com',
      password: 'password123',
    );
    expect(await repository.getCurrentSession(), isNotNull);

    await repository.signOut();
    expect(await repository.getCurrentSession(), isNull);
  });
}


import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/user_profile.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_session.dart';
import '../../domain/repositories/auth_repository.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, UserSession?>(() {
  return AuthController();
});

final currentUserProvider = Provider<UserProfile?>((ref) {
  final session = ref.watch(authControllerProvider).value;
  return session?.user;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider) != null;
});

final isAdminProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.isAdmin ?? false;
});

class AuthController extends AsyncNotifier<UserSession?> {
  late final AuthRepository _repository;
  StreamSubscription<UserSession?>? _authSubscription;

  @override
  Future<UserSession?> build() async {
    _repository = ref.watch(authRepositoryProvider);

    _authSubscription?.cancel();
    _authSubscription = _repository.watchAuthState().listen((session) {
      state = AsyncData(session);
    });

    ref.onDispose(() {
      _authSubscription?.cancel();
    });

    return await _repository.getCurrentSession();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _repository.signInWithEmail(
        email: email,
        password: password,
      );
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _repository.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
      );
    });
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repository.signOut();
      return null;
    });
  }
}


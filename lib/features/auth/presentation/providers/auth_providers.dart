import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/network/session_tokens.dart';
import '../../../../core/settings/settings_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/auth_remote_source.dart';
import '../../data/sources/session_store.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/user_role.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/auth_flow_repository.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';

/// Tells the session its refresh token was refused. The real one is set in `AppBootstrap`.
final sessionExpiryProvider = Provider<SessionExpiry>((ref) => SessionExpiry());

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    AuthRemoteSource(ref.watch(dioProvider)),
    SessionStore(ref.watch(sharedPreferencesProvider)),
  ),
);

final signInProvider = Provider<SignIn>(
  (ref) => SignIn(ref.watch(authRepositoryProvider)),
);

final signOutProvider = Provider<SignOut>(
  (ref) => SignOut(ref.watch(authRepositoryProvider)),
);

final authActionsProvider = Provider<AuthFlowRepository>(
  (ref) => ref.watch(authRepositoryProvider) as AuthFlowRepository,
);

/// Who is using the app: `null` for a guest, otherwise the signed-in account.
///
/// Read this anywhere you need the current user or their role. The router
/// listens to it, so signing in or out opens or closes guarded pages at once.
class SessionNotifier extends Notifier<AppUser?> {
  @override
  AppUser? build() {
    // A refused refresh token ends the session: back to guest.
    final sub = ref
        .read(sessionExpiryProvider)
        .stream
        .listen((_) => state = null);
    ref.onDispose(sub.cancel);
    return ref.watch(authRepositoryProvider).savedUser();
  }

  /// Throws `AuthFailure` for bad input, or a Dio error if the request fails.
  Future<void> signIn({required String email, required String password}) async {
    state = await ref
        .read(signInProvider)
        .call(SignInParams(email: email, password: password));
  }

  Future<void> signOut() async {
    await ref.read(signOutProvider).call(const NoParams());
    state = null;
  }

  /// Shows [name] everywhere once Profile saved it.
  Future<void> rename(String name) async {
    state = await ref.read(authRepositoryProvider).rename(name);
  }

  Future<void> signInWithGoogle() async {
    state = await ref.read(authActionsProvider).signInWithGoogle();
  }

  Future<void> requestSignUpOtp({
    required String name,
    required String contact,
    required String password,
  }) => ref
      .read(authActionsProvider)
      .requestSignUpOtp(name: name, contact: contact, password: password);

  Future<void> verifySignUpOtp({
    required String contact,
    required String otp,
  }) async {
    state = await ref
        .read(authActionsProvider)
        .verifySignUpOtp(contact: contact, otp: otp);
  }

  Future<void> requestPasswordReset(String contact) =>
      ref.read(authActionsProvider).requestPasswordReset(contact);

  Future<void> resetPassword({
    required String contact,
    required String otp,
    required String password,
  }) => ref
      .read(authActionsProvider)
      .resetPassword(contact: contact, otp: otp, password: password);
}

final sessionProvider = NotifierProvider<SessionNotifier, AppUser?>(
  SessionNotifier.new,
);

/// Whether the current user can open the admin area.
final isStaffProvider = Provider<bool>(
  (ref) => ref.watch(sessionProvider)?.role.isStaff ?? false,
);

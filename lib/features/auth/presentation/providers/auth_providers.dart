import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/settings/settings_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/auth_remote_source.dart';
import '../../data/sources/session_store.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/user_role.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';

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

/// Who is using the app: `null` for a guest, otherwise the signed-in account.
///
/// Read this anywhere you need the current user or their role. The router
/// listens to it, so signing in or out opens or closes guarded pages at once.
class SessionNotifier extends Notifier<AppUser?> {
  @override
  AppUser? build() => ref.watch(authRepositoryProvider).savedUser();

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
}

final sessionProvider = NotifierProvider<SessionNotifier, AppUser?>(
  SessionNotifier.new,
);

/// Whether the current user can open the admin area.
final isStaffProvider = Provider<bool>(
  (ref) => ref.watch(sessionProvider)?.role.isStaff ?? false,
);

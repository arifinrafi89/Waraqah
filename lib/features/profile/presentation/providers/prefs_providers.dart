import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/profile_prefs.dart';
import '../../domain/usecases/delete_account.dart';
import '../../domain/usecases/get_prefs.dart';
import '../../domain/usecases/save_prefs.dart';
import 'profile_providers.dart';

final getPrefsProvider = Provider<GetPrefs>(
  (ref) => GetPrefs(ref.watch(profileRepositoryProvider)),
);

final savePrefsProvider = Provider<SavePrefs>(
  (ref) => SavePrefs(ref.watch(profileRepositoryProvider)),
);

final deleteAccountProvider = Provider<DeleteAccount>(
  (ref) => DeleteAccount(ref.watch(profileRepositoryProvider)),
);

/// The signed-in Reader's notification and privacy settings; defaults for
/// a Guest.
class PrefsNotifier extends AsyncNotifier<ProfilePrefs> {
  @override
  Future<ProfilePrefs> build() async {
    final id = ref.watch(sessionProvider.select((user) => user?.id));
    if (id == null) return const ProfilePrefs();
    return ref.read(getPrefsProvider).call(const NoParams());
  }

  /// Applies [edit] to the latest settings and shows them at once; puts
  /// the old ones back if the save fails.
  Future<void> change(ProfilePrefs Function(ProfilePrefs) edit) async {
    final before = state;
    final next = edit(state.value ?? const ProfilePrefs());
    state = AsyncData(next);
    try {
      await ref.read(savePrefsProvider).call(next);
    } catch (_) {
      state = before;
      rethrow;
    }
  }

  Future<void> setMuted(NotificationGroup group, bool muted) => change(
    (now) => now.copyWith(
      muted: muted ? {...now.muted, group} : ({...now.muted}..remove(group)),
    ),
  );
}

final prefsProvider = AsyncNotifierProvider<PrefsNotifier, ProfilePrefs>(
  PrefsNotifier.new,
);

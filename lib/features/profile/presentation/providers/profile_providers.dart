import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../data/sources/profile_remote_source.dart';
import '../../domain/entities/profile_details.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/save_profile.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepositoryImpl(ProfileRemoteSource(ref.watch(dioProvider))),
);

final getProfileProvider = Provider<GetProfile>(
  (ref) => GetProfile(ref.watch(profileRepositoryProvider)),
);

final saveProfileProvider = Provider<SaveProfile>(
  (ref) => SaveProfile(ref.watch(profileRepositoryProvider)),
);

/// The signed-in Reader's profile; empty for a Guest. Reloads only when a
/// different account signs in, not when the name changes.
class ProfileNotifier extends AsyncNotifier<ProfileDetails> {
  @override
  Future<ProfileDetails> build() async {
    final id = ref.watch(sessionProvider.select((user) => user?.id));
    if (id == null) return const ProfileDetails();
    return ref.read(getProfileProvider).call(const NoParams());
  }

  /// Throws a `ProfileProblem` when [details] break `ProfileRules`. The new
  /// name shows everywhere through the session.
  Future<void> save(ProfileDetails details) async {
    final saved = await ref.read(saveProfileProvider).call(details);
    state = AsyncData(saved);
    await ref.read(sessionProvider.notifier).rename(saved.name);
  }
}

final profileProvider = AsyncNotifierProvider<ProfileNotifier, ProfileDetails>(
  ProfileNotifier.new,
);

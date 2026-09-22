import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_profile_repository.dart';
import '../models/profile.dart';
import '../repositories/profile_repository.dart';

final profileRepositoryProvider =
    Provider<ProfileRepository>((ref) => DummyProfileRepository());

final profilesProvider = Provider<List<Profile>>(
  (ref) => ref.watch(profileRepositoryProvider).getProfiles(),
);

/// The demo current user. There is no auth yet (ADR-0001); every feature that
/// needs "who am I" resolves it from here so there is one place to replace
/// when Supabase Auth lands.
const currentProfileId = 'profile-1';

final currentProfileProvider = Provider<Profile>((ref) {
  return ref
      .watch(profilesProvider)
      .firstWhere((profile) => profile.id == currentProfileId);
});

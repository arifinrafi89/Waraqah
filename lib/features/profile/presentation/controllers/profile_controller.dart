import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/domain/models/p2p_listing.dart';
import '../../../home/domain/models/profile.dart';
import '../../../home/presentation/controllers/home_controller.dart';

const currentProfileId = 'profile-1';

/// The hardcoded current user, resolved from the shared profile-listing
/// provider. No separate current-user/auth provider is introduced.
final currentProfileProvider = Provider<Profile>((ref) {
  return ref
      .watch(profilesProvider)
      .firstWhere((profile) => profile.id == currentProfileId);
});

/// The current user's own listings, unfiltered by status — unlike the public
/// P2P feed, reserved/sold listings still show here.
final myListingsProvider = Provider<List<P2pListing>>((ref) {
  final profile = ref.watch(currentProfileProvider);
  return ref
      .watch(p2pListingsProvider)
      .where((listing) => listing.sellerId == profile.id)
      .toList();
});

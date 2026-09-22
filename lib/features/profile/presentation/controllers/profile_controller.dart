import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/profile_providers.dart';
import '../../../p2p/data/p2p_providers.dart';
import '../../../p2p/domain/models/p2p_listing.dart';

/// The current user's own listings, unfiltered by status — unlike the public
/// P2P feed, reserved/sold listings still show here.
final myListingsProvider = Provider<List<P2pListing>>((ref) {
  final profile = ref.watch(currentProfileProvider);
  return ref
      .watch(p2pListingsProvider)
      .where((listing) => listing.sellerId == profile.id)
      .toList();
});

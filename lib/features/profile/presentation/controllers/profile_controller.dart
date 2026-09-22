import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/profile_providers.dart';
import '../../../p2p/data/p2p_providers.dart';
import '../../../p2p/domain/models/p2p_listing.dart';

/// The current user's own listings, unfiltered by status — unlike the public
/// P2P feed, reserved/sold listings still show here.
final myListingsProvider = FutureProvider<List<P2pListing>>((ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  final listings = await ref.watch(p2pListingsProvider.future);
  return listings.where((listing) => listing.sellerId == profile.id).toList();
});

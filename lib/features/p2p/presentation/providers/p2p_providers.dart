import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/p2p_repository_impl.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../domain/repositories/p2p_repository.dart';

final p2pRepositoryProvider = Provider<P2pRepository>(
  (ref) => P2pRepositoryImpl(),
);

final nearbyListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pRepositoryProvider).fetchNearbyListings(limit: 4),
);

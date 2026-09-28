import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/state/selection_notifier.dart';
import '../../data/repositories/p2p_repository_impl.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../domain/repositories/p2p_repository.dart';

final p2pRepositoryProvider = Provider<P2pRepository>(
  (ref) => P2pRepositoryImpl(),
);

final nearbyListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pRepositoryProvider).fetchNearbyListings(limit: 4),
);

final p2pListingsProvider = FutureProvider<List<P2pListing>>(
  (ref) => ref.watch(p2pRepositoryProvider).fetchNearbyListings(limit: 12),
);

final p2pFilterProvider = selectionProvider<P2pFilter>(P2pFilter.all);
final p2pQueryProvider = selectionProvider<String>('');

final filteredP2pListingsProvider = Provider<List<P2pListing>>((ref) {
  final filter = ref.watch(p2pFilterProvider);
  final query = ref.watch(p2pQueryProvider);
  final asyncListings = ref.watch(p2pListingsProvider);

  return switch (asyncListings) {
    AsyncData(:final value) => value
        .where((listing) => listing.matchesFilter(filter, query))
        .toList(),
    _ => const [],
  };
});

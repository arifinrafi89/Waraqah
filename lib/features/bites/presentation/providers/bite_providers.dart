import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/bite_repository_impl.dart';
import '../../domain/entities/bite.dart';
import '../../domain/repositories/bite_repository.dart';

final biteRepositoryProvider = Provider<BiteRepository>(
  (ref) => BiteRepositoryImpl(),
);

/// The short strip Home renders. The full Bites tab reuses the same provider
/// with a larger limit once that phase lands.
final biteFeedProvider = FutureProvider<List<Bite>>(
  (ref) => ref.watch(biteRepositoryProvider).fetchFeed(limit: 4),
);

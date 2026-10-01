import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/collection.dart';
import '../../domain/entities/expert.dart';
import '../../domain/usecases/get_collections.dart';
import '../../domain/usecases/get_expert.dart';
import 'catalog_providers.dart';

/// Staff's own Collections (no Expert): every one (`null`) or a Section's.
/// Home reads this too.
final staffCollectionsProvider =
    FutureProvider.family<List<Collection>, Section?>(
      (ref, section) => GetCollections(
        ref.watch(catalogRecordsRepositoryProvider),
      )((section: section, hasExpert: false)),
    );

/// Expert Picks: every one (`null`) or a Section's. Home reads this too.
final expertPicksProvider = FutureProvider.family<List<Collection>, Section?>(
  (ref, section) => GetCollections(ref.watch(catalogRecordsRepositoryProvider))(
    (section: section, hasExpert: true),
  ),
);

/// Every Expert.
final expertsProvider = FutureProvider<List<Expert>>(
  (ref) =>
      GetExperts(ref.watch(catalogRecordsRepositoryProvider))(const NoParams()),
);

/// One Expert with their Expert Picks; `null` when unknown.
final expertProvider = FutureProvider.family<ExpertDetail?, String>(
  (ref, id) => GetExpert(ref.watch(catalogRecordsRepositoryProvider))(id),
);

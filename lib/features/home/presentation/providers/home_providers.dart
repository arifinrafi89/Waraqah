import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../data/repositories/ayah_repository_impl.dart';
import '../../domain/entities/ayah.dart';
import '../../domain/repositories/ayah_repository.dart';

/// Islamic curation filter across the home feed.
enum BenefitFilter { all, beneficial, nonBeneficial }

final ayahRepositoryProvider = Provider<AyahRepository>(
  (ref) => AyahRepositoryImpl(),
);

final ayahOfTheDayProvider = FutureProvider<Ayah>(
  (ref) => ref.watch(ayahRepositoryProvider).fetchAyahOfTheDay(),
);

final benefitFilterProvider = selectionProvider<BenefitFilter>(
  BenefitFilter.all,
);

/// New arrivals from the catalog block, narrowed by the curation filter.
///
/// Home never touches the catalog's data layer — it composes the catalog's
/// public repository, which is what keeps the two LEGO blocks independent.
final homeNewArrivalsProvider = FutureProvider<List<Book>>((ref) async {
  final books = await ref.watch(bookRepositoryProvider).fetchNewArrivals();
  final filter = ref.watch(benefitFilterProvider);
  return switch (filter) {
    BenefitFilter.all => books,
    BenefitFilter.beneficial => books.where((b) => b.isBeneficial).toList(),
    BenefitFilter.nonBeneficial => books.where((b) => !b.isBeneficial).toList(),
  };
});

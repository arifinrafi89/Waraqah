import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../data/repositories/ayah_repository_impl.dart';
import '../../data/sources/ayah_remote_source.dart';
import '../../domain/entities/ayah.dart';
import '../../domain/entities/benefit_filter.dart';
import '../../domain/repositories/ayah_repository.dart';
import '../../domain/usecases/get_ayah_of_the_day.dart';
import '../../domain/usecases/get_new_arrivals.dart';

final ayahRepositoryProvider = Provider<AyahRepository>(
  (ref) => AyahRepositoryImpl(AyahRemoteSource(ref.watch(dioProvider))),
);

final getAyahOfTheDayProvider = Provider<GetAyahOfTheDay>(
  (ref) => GetAyahOfTheDay(ref.watch(ayahRepositoryProvider)),
);

final getNewArrivalsProvider = Provider<GetNewArrivals>(
  (ref) => GetNewArrivals(ref.watch(bookRepositoryProvider)),
);

final ayahOfTheDayProvider = FutureProvider<Ayah>(
  (ref) => ref.watch(getAyahOfTheDayProvider).call(const NoParams()),
);

/// Whether Home's glass header is on screen. `AutoHideHeader` hides it a
/// moment after the user scrolls past it and shows it again on scroll up.
final homeHeaderVisibleProvider = selectionProvider<bool>(true);

final benefitFilterProvider = selectionProvider<BenefitFilter>(
  BenefitFilter.all,
);

/// New arrivals from the catalog block, narrowed by the curation filter.
///
/// Home never touches the catalog's data layer — it composes the catalog's
/// use case, which is what keeps the two LEGO blocks independent.
final homeNewArrivalsProvider = FutureProvider<List<Book>>((ref) {
  final filter = ref.watch(benefitFilterProvider);
  return ref.watch(getNewArrivalsProvider).call(filter);
});

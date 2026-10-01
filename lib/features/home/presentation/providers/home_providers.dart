import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../data/repositories/ayah_repository_impl.dart';
import '../../data/sources/ayah_remote_source.dart';
import '../../data/repositories/banner_repository_impl.dart';
import '../../data/sources/banner_remote_source.dart';
import '../../domain/entities/ayah.dart';
import '../../domain/entities/banner.dart';
import '../../domain/entities/season.dart';
import '../../domain/repositories/ayah_repository.dart';
import '../../domain/repositories/banner_repository.dart';
import '../../domain/usecases/get_ayah_of_the_day.dart';
import '../../domain/usecases/get_banners.dart';
import '../../domain/usecases/get_bestsellers.dart';
import '../../domain/usecases/get_new_arrivals.dart';
import '../../domain/usecases/get_season.dart';

final ayahRepositoryProvider = Provider<AyahRepository>(
  (ref) => AyahRepositoryImpl(AyahRemoteSource(ref.watch(dioProvider))),
);

final getAyahOfTheDayProvider = Provider<GetAyahOfTheDay>(
  (ref) => GetAyahOfTheDay(ref.watch(ayahRepositoryProvider)),
);

final getNewArrivalsProvider = Provider<GetNewArrivals>(
  (ref) => GetNewArrivals(ref.watch(bookRepositoryProvider)),
);

final getBestsellersProvider = Provider<GetBestsellers>(
  (ref) => GetBestsellers(ref.watch(bookRepositoryProvider)),
);

final ayahOfTheDayProvider = FutureProvider<Ayah>(
  (ref) => ref.watch(getAyahOfTheDayProvider).call(const NoParams()),
);

/// Whether Home's glass header is on screen. `AutoHideHeader` hides it a
/// moment after the user scrolls past it and shows it again on scroll up.
final homeHeaderVisibleProvider = selectionProvider<bool>(true);

/// New arrivals and Bestsellers from the catalog block.
///
/// Home never touches the catalog's data layer — it composes the catalog's
/// use case, which is what keeps the two LEGO blocks independent.
final homeNewArrivalsProvider = FutureProvider<List<Book>>(
  (ref) => ref.watch(getNewArrivalsProvider).call(const NoParams()),
);

final homeBestsellersProvider = FutureProvider<List<Book>>(
  (ref) => ref.watch(getBestsellersProvider).call(const NoParams()),
);

/// Banners and the Season, cached together; Admin invalidates it after a
/// change.
final bannerRepositoryProvider = Provider<BannerRepository>(
  (ref) => BannerRepositoryImpl(BannerRemoteSource(ref.watch(dioProvider))),
);

final getBannersProvider = Provider<GetBanners>(
  (ref) => GetBanners(ref.watch(bannerRepositoryProvider)),
);

final bannersProvider = FutureProvider<List<Banner>>(
  (ref) => ref.watch(getBannersProvider).call(const NoParams()),
);

/// The Season Home's hero card shows, or `null` when none is on.
final homeSeasonProvider = FutureProvider<SeasonInfo?>(
  (ref) => GetSeason(ref.watch(bannerRepositoryProvider))(const NoParams()),
);

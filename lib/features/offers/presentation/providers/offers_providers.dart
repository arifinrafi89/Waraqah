import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/offers_repository_impl.dart';
import '../../data/sources/offers_remote_source.dart';
import '../../domain/entities/offers.dart';
import '../../domain/repositories/offers_repository.dart';
import '../../domain/usecases/get_offers.dart';

final offersRepositoryProvider = Provider<OffersRepository>(
  (ref) => OffersRepositoryImpl(OffersRemoteSource(ref.watch(dioProvider))),
);

final getOffersProvider = Provider<GetOffers>(
  (ref) => GetOffers(ref.watch(offersRepositoryProvider)),
);

/// The flash sale, bundles and pre-orders running now.
final offersProvider = FutureProvider<Offers>(
  (ref) => ref.watch(getOffersProvider).call(const NoParams()),
);

/// The flash-sale price of one Edition, while it's in the sale.
final flashItemProvider = Provider.family<OfferItem?, String>(
  (ref, editionId) => ref.watch(offersProvider).value?.flashItem(editionId),
);

/// Bundles that include one book.
final bundlesForBookProvider = Provider.family<List<Bundle>, String>(
  (ref, bookId) => ref.watch(offersProvider).value?.bundlesWith(bookId) ?? [],
);

/// Release details for a pre-order Edition.
final preorderProvider = Provider.family<Preorder?, String>(
  (ref, editionId) => ref.watch(offersProvider).value?.preorder(editionId),
);

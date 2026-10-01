import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/deals_repository_impl.dart';
import '../../data/sources/deals_remote_source.dart';
import '../../domain/entities/deals.dart';
import '../../domain/repositories/deals_repository.dart';
import '../../domain/usecases/get_deals.dart';

final dealsRepositoryProvider = Provider<DealsRepository>(
  (ref) => DealsRepositoryImpl(DealsRemoteSource(ref.watch(dioProvider))),
);

final getDealsProvider = Provider<GetDeals>(
  (ref) => GetDeals(ref.watch(dealsRepositoryProvider)),
);

/// The flash sale, bundles and pre-orders running now.
final dealsProvider = FutureProvider<Deals>(
  (ref) => ref.watch(getDealsProvider).call(const NoParams()),
);

/// The flash-sale price of one Edition, while it's in the sale.
final flashItemProvider = Provider.family<DealItem?, String>(
  (ref, editionId) => ref.watch(dealsProvider).value?.flashItem(editionId),
);

/// Bundles that include one book.
final bundlesForBookProvider = Provider.family<List<Bundle>, String>(
  (ref, bookId) => ref.watch(dealsProvider).value?.bundlesWith(bookId) ?? [],
);

/// Release details for a pre-order Edition.
final preorderProvider = Provider.family<Preorder?, String>(
  (ref, editionId) => ref.watch(dealsProvider).value?.preorder(editionId),
);

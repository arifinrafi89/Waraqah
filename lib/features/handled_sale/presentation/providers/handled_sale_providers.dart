import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/handled_sale_repository_impl.dart';
import '../../data/sources/handled_sale_remote_source.dart';
import '../../domain/entities/earnings.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/entities/sale_dispute.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import '../../domain/usecases/get_disputes.dart';
import '../../domain/usecases/get_earnings.dart';
import '../../domain/usecases/get_my_sales.dart';
import '../../domain/usecases/get_sale.dart';
import '../../domain/usecases/settle_dispute.dart';

export 'handled_sale_use_cases.dart';

final handledSaleRepositoryProvider = Provider<HandledSaleRepository>(
  (ref) => HandledSaleRepositoryImpl(
    HandledSaleRemoteSource(ref.watch(dioProvider)),
  ),
);

/// The reader's handled sales, buying and selling. Empty for a guest.
final mySalesProvider = FutureProvider.autoDispose<List<HandledSale>>((
  ref,
) async {
  if (ref.watch(sessionProvider) == null) return const [];
  final repository = ref.watch(handledSaleRepositoryProvider);
  return GetMySales(repository).call(const NoParams());
});

final saleProvider = FutureProvider.autoDispose.family<HandledSale?, String>(
  (ref, id) => GetSale(ref.watch(handledSaleRepositoryProvider)).call(id),
);

final earningsProvider = FutureProvider.autoDispose<Earnings>(
  (ref) =>
      GetEarnings(ref.watch(handledSaleRepositoryProvider))
          .call(const NoParams()),
);

/// Open disputes, for the Moderation Center.
class SaleDisputesNotifier extends AsyncNotifier<List<SaleDispute>> {
  @override
  Future<List<SaleDispute>> build() =>
      GetDisputes(ref.read(handledSaleRepositoryProvider))
          .call(const NoParams());

  Future<void> settle(
    String id, {
    required bool refund,
    required String by,
  }) async => state = AsyncData(
    await SettleDispute(ref.read(handledSaleRepositoryProvider))
        .call((id: id, refund: refund, by: by)),
  );
}

final saleDisputesProvider =
    AsyncNotifierProvider<SaleDisputesNotifier, List<SaleDispute>>(
      SaleDisputesNotifier.new,
    );

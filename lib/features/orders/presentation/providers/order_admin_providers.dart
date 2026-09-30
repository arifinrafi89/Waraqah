import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/order_admin_repository_impl.dart';
import '../../data/sources/order_admin_remote_source.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/repositories/order_admin_repository.dart';
import '../../domain/usecases/advance_order.dart';
import '../../domain/usecases/decide_return.dart';
import '../../domain/usecases/get_all_orders.dart';
import 'order_providers.dart';

final orderAdminRepositoryProvider = Provider<OrderAdminRepository>(
  (ref) =>
      OrderAdminRepositoryImpl(OrderAdminRemoteSource(ref.watch(dioProvider))),
);

final getAllOrdersProvider = Provider<GetAllOrders>(
  (ref) => GetAllOrders(ref.watch(orderAdminRepositoryProvider)),
);

final advanceOrderProvider = Provider<AdvanceOrder>(
  (ref) => AdvanceOrder(ref.watch(orderAdminRepositoryProvider)),
);

final decideReturnProvider = Provider<DecideReturn>(
  (ref) => DecideReturn(ref.watch(orderAdminRepositoryProvider)),
);

/// Every order, for support staff. Each change swaps in the updated order
/// and refreshes the reader's own views of it.
class AllOrdersNotifier extends AsyncNotifier<List<Order>> {
  @override
  Future<List<Order>> build() =>
      ref.read(getAllOrdersProvider).call(const NoParams());

  Future<void> advance(Order order) async =>
      _swap(await ref.read(advanceOrderProvider).call(order));

  Future<void> decideReturn(Order order, {required bool approve}) async =>
      _swap(
        await ref
            .read(decideReturnProvider)
            .call(DecideReturnParams(number: order.number, approve: approve)),
      );

  void _swap(Order changed) {
    state = AsyncData([
      for (final order in state.value ?? const <Order>[])
        order.number == changed.number ? changed : order,
    ]);
    ref
      ..invalidate(orderProvider(changed.number))
      ..invalidate(myOrdersProvider);
  }
}

final allOrdersProvider = AsyncNotifierProvider<AllOrdersNotifier, List<Order>>(
  AllOrdersNotifier.new,
);

/// Which status the staff orders list shows; `null` for all.
final adminOrderFilterProvider = selectionProvider<OrderStatus?>(null);

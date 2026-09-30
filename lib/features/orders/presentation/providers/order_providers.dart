import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../data/sources/order_remote_source.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_return.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/usecases/cancel_order.dart';
import '../../domain/usecases/get_my_orders.dart';
import '../../domain/usecases/get_order.dart';
import '../../domain/usecases/request_return.dart';

final orderRepositoryProvider = Provider<OrderRepository>(
  (ref) => OrderRepositoryImpl(OrderRemoteSource(ref.watch(dioProvider))),
);

final getMyOrdersProvider = Provider<GetMyOrders>(
  (ref) => GetMyOrders(ref.watch(orderRepositoryProvider)),
);

final getOrderProvider = Provider<GetOrder>(
  (ref) => GetOrder(ref.watch(orderRepositoryProvider)),
);

final cancelOrderProvider = Provider<CancelOrder>(
  (ref) => CancelOrder(ref.watch(orderRepositoryProvider)),
);

final requestReturnProvider = Provider<RequestReturn>(
  (ref) => RequestReturn(ref.watch(orderRepositoryProvider)),
);

/// The reader's orders, newest first.
final myOrdersProvider = FutureProvider<List<Order>>(
  (ref) => ref.watch(getMyOrdersProvider).call(const NoParams()),
);

/// One order by number, with what the reader can do to it. `null` when
/// there's no such order.
class OrderNotifier extends AsyncNotifier<Order?> {
  OrderNotifier(this.number);

  final String number;

  @override
  Future<Order?> build() => ref.read(getOrderProvider).call(number);

  /// Throws if the order can't be cancelled any more.
  Future<void> cancel() async {
    state = AsyncData(await ref.read(cancelOrderProvider).call(number));
    ref.invalidate(myOrdersProvider);
  }

  Future<void> requestReturn(
    ReturnReason reason,
    String note, {
    List<Uint8List> photos = const [],
  }) async {
    state = AsyncData(
      await ref
          .read(requestReturnProvider)
          .call(
            RequestReturnParams(
              number: number,
              reason: reason,
              note: note,
              photos: photos,
            ),
          ),
    );
    ref.invalidate(myOrdersProvider);
  }
}

final orderProvider =
    AsyncNotifierProvider.family<OrderNotifier, Order?, String>(
      OrderNotifier.new,
    );

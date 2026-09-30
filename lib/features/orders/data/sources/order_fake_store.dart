import '../../domain/entities/order.dart';
import '../../domain/entities/order_return.dart';
import '../../domain/entities/order_status.dart';
import '../models/order_model.dart';
import '../models/order_parts_model.dart';
import 'order_fixtures.dart';

/// The orders the fake backend keeps in memory, with the server's rules.
/// Checkout adds to it; the admin side (next PR) moves orders along.
class OrderFakeStore {
  OrderFakeStore({DateTime Function()? clock}) : _now = clock ?? DateTime.now {
    _orders.addAll(OrderFixtures.seed(_now()));
  }

  final DateTime Function() _now;
  final List<OrderModel> _orders = [];
  var _nextNumber = 100231;

  DateTime now() => _now();

  /// Newest first.
  List<OrderModel> get all =>
      [..._orders]..sort((a, b) => b.placedAt.compareTo(a.placedAt));

  OrderModel? find(String number) =>
      _orders.where((order) => order.number == number).firstOrNull;

  /// The next order number: WQ-100231, WQ-100232, …
  String nextNumber() => 'WQ-${_nextNumber++}';

  void add(OrderModel order) => _orders.add(order);

  /// `null` when there's no such order or it has already shipped.
  OrderModel? cancel(String number) {
    final order = find(number);
    if (order == null || !order.status.canCancel) return null;
    return _replace(order.advanceTo(OrderStatus.cancelled, _now()));
  }

  /// `null` unless the order was delivered in the last 7 days and has no
  /// return request yet.
  OrderModel? requestReturn(String number, ReturnReason reason, String note) {
    final order = find(number);
    if (order == null || !order.toEntity().canRequestReturn(_now())) {
      return null;
    }
    return _replace(
      order.copyWith(
        returnRequest: ReturnRequestModel(
          reason: reason,
          status: ReturnStatus.requested,
          requestedAt: _now(),
          note: note,
        ),
      ),
    );
  }

  OrderModel _replace(OrderModel order) {
    final index = _orders.indexWhere((o) => o.number == order.number);
    _orders[index] = order;
    return order;
  }
}

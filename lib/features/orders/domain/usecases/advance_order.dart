import '../../../../core/usecase/usecase.dart';
import '../entities/order.dart';
import '../entities/order_status.dart';
import '../repositories/order_admin_repository.dart';

/// Moves an order one step along its tracking (placed → confirmed → …).
/// Throws [StateError] once it's delivered or cancelled.
class AdvanceOrder extends UseCase<Order, Order> {
  AdvanceOrder(this._repository);

  final OrderAdminRepository _repository;

  @override
  Future<Order> call(Order params) {
    final next = params.status.next;
    if (next == null) throw StateError('${params.number} has no next step.');
    return _repository.advance(params.number, next);
  }
}

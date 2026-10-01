import '../../../../core/usecase/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class CancelOrder extends UseCase<Order, String> {
  CancelOrder(this._repository);

  final OrderRepository _repository;

  @override
  Future<Order> call(String params) => _repository.cancel(params);
}

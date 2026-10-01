import '../../../../core/usecase/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetMyOrders extends UseCase<List<Order>, NoParams> {
  GetMyOrders(this._repository);

  final OrderRepository _repository;

  @override
  Future<List<Order>> call(NoParams params) => _repository.myOrders();
}

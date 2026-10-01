import '../../../../core/usecase/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_admin_repository.dart';

class GetAllOrders extends UseCase<List<Order>, NoParams> {
  GetAllOrders(this._repository);

  final OrderAdminRepository _repository;

  @override
  Future<List<Order>> call(NoParams params) => _repository.allOrders();
}

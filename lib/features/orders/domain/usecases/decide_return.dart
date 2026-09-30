import '../../../../core/usecase/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_admin_repository.dart';

class DecideReturnParams {
  const DecideReturnParams({required this.number, required this.approve});

  final String number;
  final bool approve;
}

/// Approves or rejects a waiting return request.
class DecideReturn extends UseCase<Order, DecideReturnParams> {
  DecideReturn(this._repository);

  final OrderAdminRepository _repository;

  @override
  Future<Order> call(DecideReturnParams params) =>
      _repository.decideReturn(params.number, approve: params.approve);
}

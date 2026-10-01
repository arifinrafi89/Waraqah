import '../../../../core/usecase/usecase.dart';
import '../entities/reorder_result.dart';
import '../repositories/order_repository.dart';

/// "Buy again": the order's books go back in the cart (by order number).
class ReorderOrder extends UseCase<ReorderResult, String> {
  ReorderOrder(this._repository);

  final OrderRepository _repository;

  @override
  Future<ReorderResult> call(String params) => _repository.reorder(params);
}

import '../../../../core/usecase/usecase.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class ChangeQuantityParams {
  const ChangeQuantityParams({required this.lineId, required this.quantity});

  final String lineId;
  final int quantity;
}

/// Sets how many copies a line holds. Zero or less removes the line.
class ChangeQuantity extends UseCase<Cart, ChangeQuantityParams> {
  ChangeQuantity(this._repository);

  final CartRepository _repository;

  @override
  Future<Cart> call(ChangeQuantityParams params) => params.quantity <= 0
      ? _repository.remove(params.lineId)
      : _repository.setQuantity(params.lineId, params.quantity);
}

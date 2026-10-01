import '../../../../core/usecase/usecase.dart';
import '../entities/cart.dart';
import '../entities/cart_item_ref.dart';
import '../repositories/cart_repository.dart';

class AddToCart extends UseCase<Cart, CartItemRef> {
  AddToCart(this._repository);

  final CartRepository _repository;

  @override
  Future<Cart> call(CartItemRef params) => _repository.add(params);
}

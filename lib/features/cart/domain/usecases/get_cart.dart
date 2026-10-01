import '../../../../core/usecase/usecase.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class GetCart extends UseCase<Cart, NoParams> {
  GetCart(this._repository);

  final CartRepository _repository;

  @override
  Future<Cart> call(NoParams params) => _repository.fetch();
}

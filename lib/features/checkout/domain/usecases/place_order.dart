import '../../../../core/usecase/usecase.dart';
import '../entities/order_receipt.dart';
import '../repositories/checkout_repository.dart';

class PlaceOrder extends UseCase<OrderReceipt, PlaceOrderRequest> {
  PlaceOrder(this._repository);

  final CheckoutRepository _repository;

  @override
  Future<OrderReceipt> call(PlaceOrderRequest params) =>
      _repository.placeOrder(params);
}

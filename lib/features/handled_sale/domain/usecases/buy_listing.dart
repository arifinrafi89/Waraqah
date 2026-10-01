import '../../../../core/usecase/usecase.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../entities/handled_sale.dart';
import '../repositories/handled_sale_repository.dart';

typedef BuyParams = ({String listingId, PaymentMethod method});

/// Pays for a Listing through Waraqah. The money is held until the buyer
/// confirms, so it has to be paid up front: no cash on delivery.
class BuyListing extends UseCase<HandledSale, BuyParams> {
  BuyListing(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<HandledSale> call(BuyParams params) {
    if (!params.method.isPrepaid) {
      throw ArgumentError.value(params.method, 'method', 'must be prepaid');
    }
    return _repository.buy(params.listingId, params.method);
  }
}

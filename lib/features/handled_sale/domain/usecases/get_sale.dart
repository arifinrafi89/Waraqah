import '../../../../core/usecase/usecase.dart';
import '../entities/handled_sale.dart';
import '../repositories/handled_sale_repository.dart';

class GetSale extends UseCase<HandledSale?, String> {
  GetSale(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<HandledSale?> call(String params) => _repository.sale(params);
}

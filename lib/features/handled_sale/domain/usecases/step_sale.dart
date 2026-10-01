import '../../../../core/usecase/usecase.dart';
import '../entities/handled_sale.dart';
import '../repositories/handled_sale_repository.dart';

class StepSale extends UseCase<HandledSale, ({String id, SaleStep step})> {
  StepSale(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<HandledSale> call(({String id, SaleStep step}) params) =>
      _repository.step(params.id, params.step);
}

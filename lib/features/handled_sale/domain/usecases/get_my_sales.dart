import '../../../../core/usecase/usecase.dart';
import '../entities/handled_sale.dart';
import '../repositories/handled_sale_repository.dart';

class GetMySales extends UseCase<List<HandledSale>, NoParams> {
  GetMySales(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<List<HandledSale>> call(NoParams params) => _repository.mine();
}

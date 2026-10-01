import '../../../../core/usecase/usecase.dart';
import '../entities/sale_dispute.dart';
import '../repositories/handled_sale_repository.dart';

class GetDisputes extends UseCase<List<SaleDispute>, NoParams> {
  GetDisputes(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<List<SaleDispute>> call(NoParams params) => _repository.disputes();
}

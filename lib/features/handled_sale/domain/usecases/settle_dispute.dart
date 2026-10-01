import '../../../../core/usecase/usecase.dart';
import '../entities/sale_dispute.dart';
import '../repositories/handled_sale_repository.dart';

class SettleDispute
    extends UseCase<List<SaleDispute>, ({String id, bool refund, String by})> {
  SettleDispute(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<List<SaleDispute>> call(
    ({String id, bool refund, String by}) params,
  ) => _repository.settle(params.id, refund: params.refund, by: params.by);
}

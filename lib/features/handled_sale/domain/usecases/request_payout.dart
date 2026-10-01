import '../../../../core/usecase/usecase.dart';
import '../entities/earnings.dart';
import '../repositories/handled_sale_repository.dart';

class RequestPayout extends UseCase<Earnings, NoParams> {
  RequestPayout(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<Earnings> call(NoParams params) => _repository.payout();
}

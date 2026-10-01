import '../../../../core/usecase/usecase.dart';
import '../entities/earnings.dart';
import '../repositories/handled_sale_repository.dart';

class GetEarnings extends UseCase<Earnings, NoParams> {
  GetEarnings(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<Earnings> call(NoParams params) => _repository.earnings();
}

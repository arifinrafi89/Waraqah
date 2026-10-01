import '../../../../core/usecase/usecase.dart';
import '../entities/sell_back.dart';
import '../repositories/sell_back_repository.dart';

class GetTradeInQueue extends UseCase<List<SellBack>, NoParams> {
  GetTradeInQueue(this._repository);

  final SellBackRepository _repository;

  @override
  Future<List<SellBack>> call(NoParams params) => _repository.queue();
}

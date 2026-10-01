import '../../../../core/usecase/usecase.dart';
import '../entities/sell_back.dart';
import '../repositories/sell_back_repository.dart';

class GetMySellBacks extends UseCase<List<SellBack>, NoParams> {
  GetMySellBacks(this._repository);

  final SellBackRepository _repository;

  @override
  Future<List<SellBack>> call(NoParams params) => _repository.mine();
}

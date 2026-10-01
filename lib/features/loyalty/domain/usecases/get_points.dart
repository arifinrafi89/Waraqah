import '../../../../core/usecase/usecase.dart';
import '../entities/points_account.dart';
import '../repositories/points_repository.dart';

class GetPoints extends UseCase<PointsAccount, NoParams> {
  GetPoints(this._repository);

  final PointsRepository _repository;

  @override
  Future<PointsAccount> call(NoParams params) => _repository.account();
}

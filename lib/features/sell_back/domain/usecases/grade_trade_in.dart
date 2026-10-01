import '../../../../core/usecase/usecase.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../entities/sell_back.dart';
import '../repositories/sell_back_repository.dart';

/// Pays for a picked-up book at the grade staff give it and publishes it
/// as Certified Used, or sends it back to the reader.
class GradeTradeIn
    extends
        UseCase<
          List<SellBack>,
          ({String id, BookCondition condition, bool accept, String by})
        > {
  GradeTradeIn(this._repository);

  final SellBackRepository _repository;

  @override
  Future<List<SellBack>> call(
    ({String id, BookCondition condition, bool accept, String by}) params,
  ) => _repository.grade(
    params.id,
    condition: params.condition,
    accept: params.accept,
    by: params.by,
  );
}

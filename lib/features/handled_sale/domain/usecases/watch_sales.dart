import '../../../../core/usecase/usecase.dart';
import '../repositories/handled_sale_repository.dart';

/// The live connection: the id of each of the reader's sales as it moves.
class WatchSales extends UseCase<Stream<String>, NoParams> {
  WatchSales(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<Stream<String>> call(NoParams params) async => _repository.changes();
}

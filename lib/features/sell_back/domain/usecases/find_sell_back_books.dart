import '../../../../core/usecase/usecase.dart';
import '../entities/sell_back.dart';
import '../repositories/sell_back_repository.dart';

class FindSellBackBooks extends UseCase<List<SellBackBook>, String> {
  FindSellBackBooks(this._repository);

  final SellBackRepository _repository;

  @override
  Future<List<SellBackBook>> call(String params) =>
      _repository.books(params.trim());
}

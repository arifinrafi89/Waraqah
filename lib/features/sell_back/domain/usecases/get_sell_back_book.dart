import '../../../../core/usecase/usecase.dart';
import '../entities/sell_back.dart';
import '../repositories/sell_back_repository.dart';

class GetSellBackBook extends UseCase<SellBackBook?, String> {
  GetSellBackBook(this._repository);

  final SellBackRepository _repository;

  @override
  Future<SellBackBook?> call(String params) => _repository.book(params);
}

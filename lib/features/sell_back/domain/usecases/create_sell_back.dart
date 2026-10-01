import '../../../../core/usecase/usecase.dart';
import '../entities/sell_back.dart';
import '../entities/sell_back_rules.dart';
import '../repositories/sell_back_repository.dart';

/// Accepts the instant quote and books a pickup. The address has to be
/// enough for a courier to find.
class CreateSellBack extends UseCase<SellBack, SellBackDraft> {
  CreateSellBack(this._repository);

  final SellBackRepository _repository;

  @override
  Future<SellBack> call(SellBackDraft params) {
    final address = params.pickupAddress.trim();
    if (address.length < SellBackRules.minAddress) {
      throw ArgumentError.value(address, 'pickupAddress', 'too short');
    }
    return _repository.create(params.copyWith(pickupAddress: address));
  }
}

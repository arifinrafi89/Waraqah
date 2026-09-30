import '../../../../core/usecase/usecase.dart';
import '../entities/saved_address.dart';
import '../repositories/checkout_repository.dart';

class GetAddresses extends UseCase<List<SavedAddress>, NoParams> {
  GetAddresses(this._repository);

  final CheckoutRepository _repository;

  @override
  Future<List<SavedAddress>> call(NoParams params) => _repository.addresses();
}

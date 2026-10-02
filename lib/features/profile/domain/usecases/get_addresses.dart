import '../../../../core/usecase/usecase.dart';
import '../entities/saved_address.dart';
import '../repositories/profile_repository.dart';

/// The Reader's saved addresses, default first. Checkout uses these too.
class GetAddresses extends UseCase<List<SavedAddress>, NoParams> {
  GetAddresses(this._repository);

  final ProfileRepository _repository;

  @override
  Future<List<SavedAddress>> call(NoParams params) => _repository.addresses();
}

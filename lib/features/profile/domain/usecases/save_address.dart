import '../../../../core/usecase/usecase.dart';
import '../entities/address_rules.dart';
import '../entities/saved_address.dart';
import '../repositories/profile_repository.dart';

/// Adds or edits an address. Throws an [AddressProblem] when it breaks
/// [AddressRules].
class SaveAddress extends UseCase<List<SavedAddress>, SavedAddress> {
  SaveAddress(this._repository);

  final ProfileRepository _repository;

  @override
  Future<List<SavedAddress>> call(SavedAddress params) {
    final problem = AddressRules.check(params);
    if (problem != null) throw problem;
    return _repository.saveAddress(AddressRules.tidy(params));
  }
}

import '../../../../core/usecase/usecase.dart';
import '../entities/recipient.dart';
import '../repositories/donate_repository.dart';

/// Staff take a place off the list. Answers every place left.
class RemovePlace extends UseCase<List<Recipient>, String> {
  RemovePlace(this._repository);

  final DonateRepository _repository;

  @override
  Future<List<Recipient>> call(String params) =>
      _repository.removePlace(params);
}

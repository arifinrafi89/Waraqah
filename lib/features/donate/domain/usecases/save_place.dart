import '../../../../core/usecase/usecase.dart';
import '../entities/donate_place_draft.dart';
import '../entities/recipient.dart';
import '../repositories/donate_repository.dart';

/// Staff add a verified place, or change one. Answers every place.
class SavePlace extends UseCase<List<Recipient>, DonatePlaceDraft> {
  SavePlace(this._repository);

  final DonateRepository _repository;

  @override
  Future<List<Recipient>> call(DonatePlaceDraft params) =>
      _repository.savePlace(params);
}

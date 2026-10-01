import '../../../../core/usecase/usecase.dart';
import '../entities/recipient.dart';
import '../repositories/donate_repository.dart';

class GetRecipients extends UseCase<List<Recipient>, NoParams> {
  GetRecipients(this._repository);

  final DonateRepository _repository;

  @override
  Future<List<Recipient>> call(NoParams params) => _repository.recipients();
}

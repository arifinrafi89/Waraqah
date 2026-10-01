import '../../../../core/usecase/usecase.dart';
import '../entities/recipient.dart';
import '../repositories/donate_repository.dart';

/// One recipient by id, or `null`.
class GetRecipient extends UseCase<Recipient?, String> {
  GetRecipient(this._repository);

  final DonateRepository _repository;

  @override
  Future<Recipient?> call(String params) => _repository.recipient(params);
}

import '../../../../core/usecase/usecase.dart';
import '../entities/queued_listing.dart';
import '../repositories/moderation_repository.dart';

class GetListingQueue extends UseCase<List<QueuedListing>, NoParams> {
  GetListingQueue(this._repository);

  final ModerationRepository _repository;

  @override
  Future<List<QueuedListing>> call(NoParams params) => _repository.queue();
}

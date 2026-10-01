import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

/// Threads with messages, newest activity first; pass a listing id to get
/// just the threads about that listing.
class GetInbox extends UseCase<List<InboxThread>, String?> {
  GetInbox(this._repository);

  final InboxRepository _repository;

  @override
  Future<List<InboxThread>> call(String? params) =>
      _repository.threads(listingId: params);
}

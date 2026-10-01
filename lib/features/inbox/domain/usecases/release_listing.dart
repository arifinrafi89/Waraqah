import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

/// The seller makes a reserved book available again (by thread id), when
/// the deal falls through.
class ReleaseListing extends UseCase<InboxThread, String> {
  ReleaseListing(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(String params) => _repository.release(params);
}

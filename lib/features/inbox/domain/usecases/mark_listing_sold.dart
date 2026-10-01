import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

/// The seller marks the book sold to the thread's buyer (by thread id),
/// after the handover.
class MarkListingSold extends UseCase<InboxThread, String> {
  MarkListingSold(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(String params) => _repository.markSold(params);
}

import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

/// The buyer's thread about a listing (by listing id), started if needed,
/// so "Message" always opens the same conversation.
class OpenThread extends UseCase<InboxThread, String> {
  OpenThread(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(String params) => _repository.open(params);
}

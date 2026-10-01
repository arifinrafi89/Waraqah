import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

class MarkThreadRead extends UseCase<InboxThread, String> {
  MarkThreadRead(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(String params) => _repository.markRead(params);
}

import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

/// One thread by id, or `null`.
class GetThread extends UseCase<InboxThread?, String> {
  GetThread(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread?> call(String params) => _repository.thread(params);
}

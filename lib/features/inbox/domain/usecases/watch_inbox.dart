import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_change.dart';
import '../repositories/inbox_repository.dart';

/// Live changes to the reader's threads while the app is open.
class WatchInbox extends UseCase<Stream<InboxChange>, NoParams> {
  WatchInbox(this._repository);

  final InboxRepository _repository;

  @override
  Future<Stream<InboxChange>> call(NoParams params) async =>
      _repository.changes();
}

import '../../../../core/usecase/usecase.dart';
import '../repositories/notification_repository.dart';

/// The unread count, live, while the app is open.
class WatchNotifications extends UseCase<Stream<int>, NoParams> {
  WatchNotifications(this._repository);

  final NotificationRepository _repository;

  @override
  Future<Stream<int>> call(NoParams params) async =>
      _repository.unreadChanges();
}

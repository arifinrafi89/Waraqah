import '../../../../core/usecase/usecase.dart';
import '../entities/app_notification.dart';
import '../repositories/notification_repository.dart';

class MarkAllRead extends UseCase<List<AppNotification>, NoParams> {
  MarkAllRead(this._repository);

  final NotificationRepository _repository;

  @override
  Future<List<AppNotification>> call(NoParams params) =>
      _repository.markAllRead();
}

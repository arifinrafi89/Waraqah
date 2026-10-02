import '../../../../core/usecase/usecase.dart';
import '../entities/app_notification.dart';
import '../repositories/notification_repository.dart';

/// Marks one notification read by id.
class MarkRead extends UseCase<List<AppNotification>, String> {
  MarkRead(this._repository);

  final NotificationRepository _repository;

  @override
  Future<List<AppNotification>> call(String params) =>
      _repository.markRead(params);
}

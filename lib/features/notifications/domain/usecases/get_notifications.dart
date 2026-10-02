import '../../../../core/usecase/usecase.dart';
import '../entities/app_notification.dart';
import '../repositories/notification_repository.dart';

class GetNotifications extends UseCase<List<AppNotification>, NoParams> {
  GetNotifications(this._repository);

  final NotificationRepository _repository;

  @override
  Future<List<AppNotification>> call(NoParams params) =>
      _repository.notifications();
}

import '../../../../core/usecase/usecase.dart';
import '../entities/book_alert.dart';
import '../repositories/alert_repository.dart';

/// The reader's alerts, the ones that have happened first.
class GetAlerts extends UseCase<List<BookAlert>, NoParams> {
  GetAlerts(this._repository);

  final AlertRepository _repository;

  @override
  Future<List<BookAlert>> call(NoParams params) async =>
      sortAlerts(await _repository.alerts());
}

List<BookAlert> sortAlerts(List<BookAlert> alerts) => [
  ...alerts.where((a) => a.isTriggered),
  ...alerts.where((a) => !a.isTriggered),
];

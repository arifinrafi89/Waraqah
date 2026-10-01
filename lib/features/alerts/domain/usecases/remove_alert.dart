import '../../../../core/usecase/usecase.dart';
import '../entities/book_alert.dart';
import '../repositories/alert_repository.dart';
import 'get_alerts.dart';

class RemoveAlert extends UseCase<List<BookAlert>, String> {
  RemoveAlert(this._repository);

  final AlertRepository _repository;

  @override
  Future<List<BookAlert>> call(String params) async =>
      sortAlerts(await _repository.remove(params));
}

import '../../../../core/usecase/usecase.dart';
import '../entities/book_alert.dart';
import '../repositories/alert_repository.dart';
import 'get_alerts.dart';

/// Sets an alert. A price-drop target must be more than ৳0; it may be at or
/// above today's price, in which case the alert fires straight away.
class SetAlert extends UseCase<List<BookAlert>, AlertRequest> {
  SetAlert(this._repository);

  final AlertRepository _repository;

  @override
  Future<List<BookAlert>> call(AlertRequest params) async {
    final target = params.targetPriceBdt;
    if (params.kind == AlertKind.priceDrop && (target == null || target <= 0)) {
      throw ArgumentError.value(target, 'targetPriceBdt', 'must be above 0');
    }
    return sortAlerts(await _repository.set(params));
  }
}

import '../../domain/entities/book_alert.dart';
import '../../domain/repositories/alert_repository.dart';
import '../models/book_alert_model.dart';
import '../sources/alert_remote_source.dart';

/// No cache: whether an alert has fired can change at any time.
class AlertRepositoryImpl implements AlertRepository {
  AlertRepositoryImpl(this._source);

  final AlertRemoteSource _source;

  @override
  Future<List<BookAlert>> alerts() async => _entities(await _source.alerts());

  @override
  Future<List<BookAlert>> set(AlertRequest request) async =>
      _entities(await _source.set(request));

  @override
  Future<List<BookAlert>> remove(String alertId) async =>
      _entities(await _source.remove(alertId));

  List<BookAlert> _entities(List<BookAlertModel> models) => [
    for (final model in models) model.toEntity(),
  ];
}

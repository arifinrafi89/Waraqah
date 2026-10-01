import 'package:dio/dio.dart';

import '../../domain/entities/book_alert.dart';
import '../models/book_alert_model.dart';
import 'alert_fake_api.dart';

/// Talks to the `/alerts` endpoints, answered for now by the fake API.
class AlertRemoteSource {
  AlertRemoteSource(this._dio);

  final Dio _dio;

  Future<List<BookAlertModel>> alerts() async =>
      _list(await _dio.get<List<dynamic>>(AlertFakeApi.alerts));

  Future<List<BookAlertModel>> set(AlertRequest request) async => _list(
    await _dio.post<List<dynamic>>(
      AlertFakeApi.set,
      data: {
        'kind': request.kind.name,
        'bookId': request.bookId,
        'editionId': request.editionId,
        'targetPriceBdt': ?request.targetPriceBdt,
      },
    ),
  );

  Future<List<BookAlertModel>> remove(String alertId) async => _list(
    await _dio.post<List<dynamic>>(AlertFakeApi.remove, data: {'id': alertId}),
  );

  List<BookAlertModel> _list(Response<List<dynamic>> response) => [
    for (final json in response.data ?? const [])
      BookAlertModel.fromJson(json as Map<String, dynamic>),
  ];
}

import 'package:dio/dio.dart';

import '../../domain/repositories/moderation_repository.dart';
import '../models/audit_entry_model.dart';
import '../models/moderation_report_model.dart';
import '../models/queued_listing_model.dart';
import 'moderation_fake_api.dart';

/// Talks to the `/moderation` endpoints, answered for now by the fake API.
/// A refused change (`null`) is an error, shown by the page.
class ModerationRemoteSource {
  ModerationRemoteSource(this._dio);

  final Dio _dio;

  Future<List<QueuedListingModel>> queue() async => _list(
    await _dio.get<List<dynamic>>(ModerationFakeApi.queue),
    QueuedListingModel.fromJson,
  );

  Future<List<QueuedListingModel>> decide(ListingDecisionRequest r) async =>
      _list(
        await _dio.post<List<dynamic>>(
          ModerationFakeApi.decide,
          data: {
            'listingId': r.listingId,
            'decision': r.decision.name,
            'reason': ?r.reason,
            'by': r.by,
          },
        ),
        QueuedListingModel.fromJson,
      );

  Future<List<ModerationReportModel>> reports() async => _list(
    await _dio.get<List<dynamic>>(ModerationFakeApi.reports),
    ModerationReportModel.fromJson,
  );

  Future<List<ModerationReportModel>> act(ReportActionRequest r) async => _list(
    await _dio.post<List<dynamic>>(
      ModerationFakeApi.act,
      data: {'reportId': r.reportId, 'action': r.action.name, 'by': r.by},
    ),
    ModerationReportModel.fromJson,
  );

  Future<List<AuditEntryModel>> log() async => _list(
    await _dio.get<List<dynamic>>(ModerationFakeApi.log),
    AuditEntryModel.fromJson,
  );

  List<T> _list<T>(
    Response<List<dynamic>> response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final data = response.data;
    if (data == null) throw StateError('The server refused the change.');
    return [for (final json in data) fromJson(json as Map<String, dynamic>)];
  }
}

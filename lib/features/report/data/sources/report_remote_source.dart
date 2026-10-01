import 'package:dio/dio.dart';

import '../../domain/entities/content_report.dart';
import '../models/blocked_reader_model.dart';
import '../models/content_report_model.dart';
import 'report_fake_api.dart';

/// Talks to the `/reports` and `/blocks` endpoints, answered for now by the
/// fake API. A refused change (`null`) is an error, shown by the page.
class ReportRemoteSource {
  ReportRemoteSource(this._dio);

  final Dio _dio;

  Future<ContentReportModel> report(ReportRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ReportFakeApi.report,
      data: {
        'kind': request.target.kind.name,
        'targetId': request.target.id,
        'reason': request.reason.name,
        'note': ?request.note,
      },
    );
    final data = response.data;
    if (data == null) throw StateError('The server refused the report.');
    return ContentReportModel.fromJson(data);
  }

  Future<List<BlockedReaderModel>> blocked() =>
      _list(_dio.get<List<dynamic>>(ReportFakeApi.blocked));

  Future<List<BlockedReaderModel>> block(String readerId) => _list(
    _dio.post<List<dynamic>>(ReportFakeApi.block, data: {'readerId': readerId}),
  );

  Future<List<BlockedReaderModel>> unblock(String readerId) => _list(
    _dio.post<List<dynamic>>(
      ReportFakeApi.unblock,
      data: {'readerId': readerId},
    ),
  );

  Future<List<BlockedReaderModel>> _list(
    Future<Response<List<dynamic>>> request,
  ) async {
    final data = (await request).data;
    if (data == null) throw StateError('The server refused the change.');
    return [
      for (final json in data)
        BlockedReaderModel.fromJson(json as Map<String, dynamic>),
    ];
  }
}

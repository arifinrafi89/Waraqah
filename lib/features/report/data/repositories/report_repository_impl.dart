import '../../domain/entities/blocked_reader.dart';
import '../../domain/entities/content_report.dart';
import '../../domain/repositories/report_repository.dart';
import '../models/blocked_reader_model.dart';
import '../models/content_report_model.dart';
import '../sources/report_remote_source.dart';

/// No cache: blocks change the marketplace straight away.
class ReportRepositoryImpl implements ReportRepository {
  ReportRepositoryImpl(this._source);

  final ReportRemoteSource _source;

  @override
  Future<ContentReport> report(ReportRequest request) async =>
      (await _source.report(request)).toEntity();

  @override
  Future<List<BlockedReader>> blocked() async =>
      _entities(await _source.blocked());

  @override
  Future<List<BlockedReader>> block(String readerId) async =>
      _entities(await _source.block(readerId));

  @override
  Future<List<BlockedReader>> unblock(String readerId) async =>
      _entities(await _source.unblock(readerId));

  List<BlockedReader> _entities(List<BlockedReaderModel> models) => [
    for (final model in models) model.toEntity(),
  ];
}

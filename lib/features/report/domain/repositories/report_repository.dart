import '../entities/blocked_reader.dart';
import '../entities/content_report.dart';

/// Reports go to the Moderation Center; blocks belong to the signed-in
/// reader. Block changes answer the whole list.
abstract interface class ReportRepository {
  /// Reporting the same thing twice answers the first report.
  Future<ContentReport> report(ReportRequest request);

  /// Newest first.
  Future<List<BlockedReader>> blocked();

  Future<List<BlockedReader>> block(String readerId);

  Future<List<BlockedReader>> unblock(String readerId);
}

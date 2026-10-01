import '../../../../core/usecase/usecase.dart';
import '../entities/content_report.dart';
import '../entities/report_rules.dart';
import '../repositories/report_repository.dart';

/// Sends a report to the Moderation Center, after checking [ReportRules].
class ReportContent extends UseCase<ContentReport, ReportRequest> {
  ReportContent(this._repository);

  final ReportRepository _repository;

  @override
  Future<ContentReport> call(ReportRequest params) {
    final problem = ReportRules.check(params.reason, params.note);
    if (problem != null) {
      throw ArgumentError.value(params.note, 'note', problem.name);
    }
    final note = params.note?.trim();
    return _repository.report(
      params.copyWith(note: note == null || note.isEmpty ? null : note),
    );
  }
}

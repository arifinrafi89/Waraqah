import '../../../../core/usecase/usecase.dart';
import '../entities/moderation_report.dart';
import '../repositories/moderation_repository.dart';

/// Removes the reported thing, dismisses the report, or warns or bans its
/// owner. A third warning bans them (`ModerationRules.maxStrikes`).
class ActOnReport extends UseCase<List<ModerationReport>, ReportActionRequest> {
  ActOnReport(this._repository);

  final ModerationRepository _repository;

  @override
  Future<List<ModerationReport>> call(ReportActionRequest params) =>
      _repository.act(params);
}

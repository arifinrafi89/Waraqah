import '../../../../core/usecase/usecase.dart';
import '../entities/moderation_report.dart';
import '../repositories/moderation_repository.dart';

class GetOpenReports extends UseCase<List<ModerationReport>, NoParams> {
  GetOpenReports(this._repository);

  final ModerationRepository _repository;

  @override
  Future<List<ModerationReport>> call(NoParams params) => _repository.reports();
}

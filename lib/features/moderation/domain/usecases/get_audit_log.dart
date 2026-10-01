import '../../../../core/usecase/usecase.dart';
import '../entities/audit_entry.dart';
import '../repositories/moderation_repository.dart';

class GetAuditLog extends UseCase<List<AuditEntry>, NoParams> {
  GetAuditLog(this._repository);

  final ModerationRepository _repository;

  @override
  Future<List<AuditEntry>> call(NoParams params) => _repository.log();
}

import '../../../../core/usecase/usecase.dart';
import '../entities/blocked_reader.dart';
import '../repositories/report_repository.dart';

class GetBlockedReaders extends UseCase<List<BlockedReader>, NoParams> {
  GetBlockedReaders(this._repository);

  final ReportRepository _repository;

  @override
  Future<List<BlockedReader>> call(NoParams params) => _repository.blocked();
}

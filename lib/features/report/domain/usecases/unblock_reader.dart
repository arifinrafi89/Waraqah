import '../../../../core/usecase/usecase.dart';
import '../entities/blocked_reader.dart';
import '../repositories/report_repository.dart';

class UnblockReader extends UseCase<List<BlockedReader>, String> {
  UnblockReader(this._repository);

  final ReportRepository _repository;

  @override
  Future<List<BlockedReader>> call(String params) =>
      _repository.unblock(params);
}

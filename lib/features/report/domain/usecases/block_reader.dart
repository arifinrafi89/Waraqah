import '../../../../core/usecase/usecase.dart';
import '../entities/blocked_reader.dart';
import '../repositories/report_repository.dart';

/// Blocks a reader by id. The server refuses the signed-in reader's own id.
class BlockReader extends UseCase<List<BlockedReader>, String> {
  BlockReader(this._repository);

  final ReportRepository _repository;

  @override
  Future<List<BlockedReader>> call(String params) => _repository.block(params);
}

import '../../../../core/usecase/usecase.dart';
import '../entities/reading_stats.dart';
import '../repositories/shelf_repository.dart';

/// The reader's year in books.
class GetReadingStats extends UseCase<ReadingStats, NoParams> {
  GetReadingStats(this._repository);

  final ShelfRepository _repository;

  @override
  Future<ReadingStats> call(NoParams params) => _repository.stats();
}

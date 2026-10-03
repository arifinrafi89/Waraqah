import '../../../../core/usecase/usecase.dart';
import '../entities/reading_stats.dart';
import '../repositories/shelf_repository.dart';

/// Sets how many Books the reader means to finish this year.
class SetReadingGoal extends UseCase<ReadingStats, int> {
  SetReadingGoal(this._repository);

  final ShelfRepository _repository;

  @override
  Future<ReadingStats> call(int params) => _repository.setGoal(params);
}

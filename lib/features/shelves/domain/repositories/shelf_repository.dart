import '../entities/reading_stats.dart';
import '../entities/shelf_entry.dart';

abstract interface class ShelfRepository {
  /// Every Book on the reader's shelves, newest first.
  Future<List<ShelfEntry>> mine();

  /// Moves a Book; answers the shelves after the move.
  Future<List<ShelfEntry>> move(ShelfMove move);

  /// Saves how far the reader got; answers the shelves.
  Future<List<ShelfEntry>> progress(ProgressUpdate update);

  Future<ReadingStats> stats();

  /// Sets the yearly goal; answers the stats.
  Future<ReadingStats> setGoal(int goal);
}

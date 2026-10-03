import '../../domain/entities/reading_stats.dart';
import '../../domain/entities/shelf_entry.dart';
import '../../domain/repositories/shelf_repository.dart';
import '../models/reading_stats_model.dart';
import '../models/shelf_entry_model.dart';
import '../sources/shelf_remote_source.dart';

/// No cache: moving a Book changes the shelves at once.
class ShelfRepositoryImpl implements ShelfRepository {
  ShelfRepositoryImpl(this._source);

  final ShelfRemoteSource _source;

  @override
  Future<List<ShelfEntry>> mine() async => [
    for (final entry in await _source.mine()) entry.toEntity(),
  ];

  @override
  Future<List<ShelfEntry>> move(ShelfMove move) async => [
    for (final entry in await _source.move(move)) entry.toEntity(),
  ];

  @override
  Future<List<ShelfEntry>> progress(ProgressUpdate update) async => [
    for (final entry in await _source.progress(update)) entry.toEntity(),
  ];

  @override
  Future<ReadingStats> stats() async => (await _source.stats()).toEntity();

  @override
  Future<ReadingStats> setGoal(int goal) async =>
      (await _source.setGoal(goal)).toEntity();
}

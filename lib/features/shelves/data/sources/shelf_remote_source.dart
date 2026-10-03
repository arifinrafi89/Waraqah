import 'package:dio/dio.dart';

import '../../domain/entities/shelf_entry.dart';
import '../models/reading_stats_model.dart';
import '../models/shelf_entry_model.dart';
import 'shelf_fake_api.dart';

/// Talks to the `/shelves` endpoints, answered for now by the fake API.
/// A refused move (`null`) is an error, shown by the page.
class ShelfRemoteSource {
  ShelfRemoteSource(this._dio);

  final Dio _dio;

  Future<List<ShelfEntryModel>> mine() async =>
      _list(await _dio.get<List<dynamic>>(ShelfFakeApi.mine));

  Future<List<ShelfEntryModel>> move(ShelfMove move) async => _list(
    await _dio.post<List<dynamic>>(
      ShelfFakeApi.move,
      data: {'bookId': move.bookId, 'shelf': ?move.shelf?.name},
    ),
  );

  Future<List<ShelfEntryModel>> progress(ProgressUpdate update) async => _list(
    await _dio.post<List<dynamic>>(
      ShelfFakeApi.progress,
      data: {
        'bookId': update.bookId,
        'percent': update.percent,
        'pagesRead': ?update.pagesRead,
        'totalPages': ?update.totalPages,
      },
    ),
  );

  Future<ReadingStatsModel> stats() async =>
      _stats(await _dio.get<Map<String, dynamic>>(ShelfFakeApi.stats));

  Future<ReadingStatsModel> setGoal(int goal) async => _stats(
    await _dio.post<Map<String, dynamic>>(
      ShelfFakeApi.goal,
      data: {'goal': goal},
    ),
  );

  ReadingStatsModel _stats(Response<Map<String, dynamic>> response) {
    final data = response.data;
    if (data == null) throw StateError('The server refused the goal.');
    return ReadingStatsModel.fromJson(data);
  }

  List<ShelfEntryModel> _list(Response<List<dynamic>> response) {
    final data = response.data;
    if (data == null) throw StateError('The server refused the change.');
    return [
      for (final json in data)
        ShelfEntryModel.fromJson(json as Map<String, dynamic>),
    ];
  }
}

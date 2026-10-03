import 'package:dio/dio.dart';

import '../../domain/entities/progress_rules.dart';
import '../../domain/entities/shelf_entry.dart';
import 'shelf_fake_store.dart';

/// The shelves' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class ShelfFakeApi {
  /// The signed-in reader's shelves, newest first.
  static const String mine = '/shelves';

  /// Body `{bookId, shelf}`; no `shelf` takes the Book off. Answers the
  /// shelves, or `null` for a Book the catalog doesn't have.
  static const String move = '/shelves/move';

  /// Body `{bookId, percent, pagesRead?, totalPages?}`. Answers the
  /// shelves, or `null` when it breaks `ProgressRules`.
  static const String progress = '/shelves/progress';

  /// The reader's year in books: goal, streak, per month, Categories.
  static const String stats = '/reading/stats';

  /// Body `{goal}` (1–365). Answers the stats, or `null`.
  static const String goal = '/reading/goal';

  static Map<String, Object? Function(RequestOptions)> routes(
    ShelfFakeStore store,
  ) => {
    mine: (_) => store.mine(),
    move: (options) {
      final body = options.data as Map<String, dynamic>? ?? const {};
      final shelf = Shelf.values
          .where((s) => s.name == body['shelf'])
          .firstOrNull;
      return store.move(body['bookId'] as String? ?? '', shelf)
          ? store.mine()
          : null;
    },
    progress: (options) {
      final body = options.data as Map<String, dynamic>? ?? const {};
      return store.progress((
            bookId: body['bookId'] as String? ?? '',
            percent: body['percent'] as int? ?? -1,
            pagesRead: body['pagesRead'] as int?,
            totalPages: body['totalPages'] as int?,
          ))
          ? store.mine()
          : null;
    },
    stats: (_) => store.statsJson(),
    goal: (options) {
      final goal = (options.data as Map?)?['goal'] as int? ?? 0;
      if (!ProgressRules.goalIsValid(goal)) return null;
      store.log.goal = goal;
      return store.statsJson();
    },
  };
}

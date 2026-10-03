import 'package:go_router/go_router.dart';

import 'presentation/pages/reading_stats_page.dart';
import 'presentation/pages/shelves_page.dart';

abstract final class ShelvesRoutes {
  /// The reader's shelves. Signed-in only.
  static const String shelves = '/shelves';

  /// The reader's year in books.
  static const String stats = '/shelves/stats';

  static final List<RouteBase> routes = [
    GoRoute(path: shelves, builder: (_, _) => const ShelvesPage()),
    GoRoute(path: stats, builder: (_, _) => const ReadingStatsPage()),
  ];
}

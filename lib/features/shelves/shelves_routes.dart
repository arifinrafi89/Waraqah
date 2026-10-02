import 'package:go_router/go_router.dart';

import 'presentation/pages/shelves_page.dart';
import 'presentation/pages/reading_stats_page.dart';

abstract final class ShelvesRoutes {
  static const String shelves = '/shelves';
  static const String readingStats = '/reading-stats';

  static final List<RouteBase> routes = [
    GoRoute(path: shelves, builder: (_, _) => const ShelvesPage()),
    GoRoute(path: readingStats, builder: (_, _) => const ReadingStatsPage()),
  ];
}

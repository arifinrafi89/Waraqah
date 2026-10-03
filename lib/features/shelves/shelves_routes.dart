import 'package:go_router/go_router.dart';

import 'presentation/pages/shelves_page.dart';

abstract final class ShelvesRoutes {
  /// The reader's shelves. Signed-in only.
  static const String shelves = '/shelves';

  static final List<RouteBase> routes = [
    GoRoute(path: shelves, builder: (_, _) => const ShelvesPage()),
  ];
}

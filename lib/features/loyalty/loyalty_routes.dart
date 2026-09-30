import 'package:go_router/go_router.dart';

import 'presentation/pages/points_page.dart';

abstract final class LoyaltyRoutes {
  /// Signed-in only (see `RouteAccess.signedInOnly`).
  static const String points = '/points';

  static final List<RouteBase> routes = [
    GoRoute(path: points, builder: (_, _) => const PointsPage()),
  ];
}

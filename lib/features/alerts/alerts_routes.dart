import 'package:go_router/go_router.dart';

import 'presentation/pages/alerts_page.dart';

abstract final class AlertsRoutes {
  /// Signed-in only (see `RouteAccess.signedInOnly`).
  static const String alerts = '/alerts';

  static final List<RouteBase> routes = [
    GoRoute(path: alerts, builder: (_, _) => const AlertsPage()),
  ];
}

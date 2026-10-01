import 'package:go_router/go_router.dart';

import 'presentation/pages/alerts_page.dart';
import 'presentation/pages/notification_center_page.dart';

abstract final class AlertsRoutes {
  /// Signed-in only (see `RouteAccess.signedInOnly`).
  static const String alerts = '/alerts';
  static const String notifications = '/notifications';

  static final List<RouteBase> routes = [
    GoRoute(path: alerts, builder: (_, _) => const AlertsPage()),
    GoRoute(
      path: notifications,
      builder: (_, _) => const NotificationCenterPage(),
    ),
  ];
}

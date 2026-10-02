import 'package:go_router/go_router.dart';

import 'presentation/pages/notification_center_page.dart';

abstract final class NotificationsRoutes {
  /// The notification center. Signed-in only (see
  /// `RouteAccess.signedInOnly`).
  static const String center = '/notifications';

  static final List<RouteBase> routes = [
    GoRoute(path: center, builder: (_, _) => const NotificationCenterPage()),
  ];
}

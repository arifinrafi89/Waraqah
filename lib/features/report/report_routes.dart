import 'package:go_router/go_router.dart';

import 'presentation/pages/blocked_readers_page.dart';

abstract final class ReportRoutes {
  /// The readers the signed-in reader blocked. Signed-in only (see
  /// `RouteAccess.signedInOnly`).
  static const String blocked = '/blocked';

  static final List<RouteBase> routes = [
    GoRoute(path: blocked, builder: (_, _) => const BlockedReadersPage()),
  ];
}

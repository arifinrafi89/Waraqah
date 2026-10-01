import 'package:go_router/go_router.dart';

import 'presentation/pages/deals_page.dart';

abstract final class DealsRoutes {
  static const String deals = '/deals';

  static final List<RouteBase> routes = [
    GoRoute(path: deals, builder: (_, _) => const DealsPage()),
  ];
}

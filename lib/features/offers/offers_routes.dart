import 'package:go_router/go_router.dart';

import 'presentation/pages/offers_page.dart';

abstract final class OffersRoutes {
  static const String offers = '/offers';

  static final List<RouteBase> routes = [
    GoRoute(path: offers, builder: (_, _) => const OffersPage()),
  ];
}

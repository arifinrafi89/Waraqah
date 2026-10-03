import 'package:go_router/go_router.dart';

import 'domain/entities/admin_section.dart';
import 'presentation/pages/admin_dashboard_page.dart';
import 'presentation/pages/admin_hub_page.dart';
import '../catalog_admin/catalog_admin_routes.dart';
import '../catalog_admin/presentation/pages/catalog_admin_page.dart';
import '../moderation/presentation/pages/moderation_center_page.dart';
import '../sell_back/presentation/pages/trade_in_page.dart';
import '../orders/presentation/pages/orders_admin_page.dart';

abstract final class AdminRoutes {
  /// The Admin area hub. Everything under it is staff only.
  static const String admin = '/admin';

  /// Location of one Admin section, e.g. `/admin/orders`.
  static String section(AdminSection section) => '$admin/${section.name}';

  /// Every section has its real page now.
  static final List<RouteBase> routes = [
    GoRoute(
      path: admin,
      builder: (_, _) => const AdminHubPage(),
      routes: [
        GoRoute(
          path: AdminSection.dashboard.name,
          builder: (_, _) => const AdminDashboardPage(),
        ),
        GoRoute(
          path: AdminSection.catalog.name,
          builder: (_, _) => const CatalogAdminPage(),
          routes: CatalogAdminRoutes.routes,
        ),
        GoRoute(
          path: AdminSection.orders.name,
          builder: (_, _) => const OrdersAdminPage(),
        ),
        GoRoute(
          path: AdminSection.moderation.name,
          builder: (_, _) => const ModerationCenterPage(),
        ),
        GoRoute(
          path: AdminSection.tradeIn.name,
          builder: (_, _) => const TradeInPage(),
        ),
      ],
    ),
  ];
}

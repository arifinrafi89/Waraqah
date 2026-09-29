import '../../features/bites/bites_routes.dart';
import '../../features/catalog/catalog_routes.dart';
import '../../features/home/home_routes.dart';
import '../../features/p2p/p2p_routes.dart';
import '../../features/profile/profile_routes.dart';

/// Order of the branches inside the shell — the bottom nav reads this, and
/// [AppRouter] lists the feature branches in the same order.
abstract final class ShellTabs {
  static const List<String> paths = [
    HomeRoutes.home,
    CatalogRoutes.catalog,
    P2pRoutes.p2p,
    BitesRoutes.bites,
    ProfileRoutes.profile,
  ];
}

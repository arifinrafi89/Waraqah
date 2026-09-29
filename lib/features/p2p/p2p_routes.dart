import 'package:go_router/go_router.dart';

import 'presentation/pages/p2p_add_listing_page.dart';
import 'presentation/pages/p2p_page.dart';

abstract final class P2pRoutes {
  static const String p2p = '/p2p';
  static const String addListing = '/p2p/add-listing';

  static final List<RouteBase> routes = [
    GoRoute(path: addListing, builder: (_, _) => const P2pAddListingPage()),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: p2p, builder: (_, _) => const P2pPage())],
  );
}

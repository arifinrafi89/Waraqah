import 'package:go_router/go_router.dart';

import 'presentation/pages/wishlist_page.dart';

abstract final class WishlistRoutes {
  static const String wishlist = '/wishlist';

  static final List<RouteBase> routes = [
    GoRoute(path: wishlist, builder: (_, _) => const WishlistPage()),
  ];
}

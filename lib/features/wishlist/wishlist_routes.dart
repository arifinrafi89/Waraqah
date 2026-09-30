import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'presentation/pages/shared_wishlist_page.dart';
import 'presentation/pages/wishlist_page.dart';

abstract final class WishlistRoutes {
  static const String wishlist = '/wishlist';

  /// Someone's wishlist from its link. Open to guests, so friends without
  /// an account can see it too.
  static const String shared = '/wishlist/shared';

  static String sharedFor(String id) => '$shared/$id';

  /// The link a reader sends. On the web it opens this same app (the router
  /// uses the default `#` URLs); elsewhere it points at Waraqah's website.
  static String linkFor(String id) => kIsWeb
      ? '${Uri.base.origin}/#${sharedFor(id)}'
      : 'https://waraqah.app${sharedFor(id)}';

  static final List<RouteBase> routes = [
    GoRoute(path: wishlist, builder: (_, _) => const WishlistPage()),
    GoRoute(
      path: '$shared/:id',
      builder: (_, state) =>
          SharedWishlistPage(id: state.pathParameters['id'] ?? ''),
    ),
  ];
}

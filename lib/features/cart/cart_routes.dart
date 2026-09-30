import 'package:go_router/go_router.dart';

import 'presentation/pages/cart_page.dart';

abstract final class CartRoutes {
  /// Open to guests too; checkout is what asks them to sign in.
  static const String cart = '/cart';

  static final List<RouteBase> routes = [
    GoRoute(path: cart, builder: (_, _) => const CartPage()),
  ];
}

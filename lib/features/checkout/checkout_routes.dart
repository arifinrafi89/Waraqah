import 'package:go_router/go_router.dart';

import 'presentation/pages/checkout_page.dart';
import 'presentation/pages/order_placed_page.dart';

abstract final class CheckoutRoutes {
  /// Signed-in only (see `RouteAccess.signedInOnly`); guests log in first.
  static const String checkout = '/checkout';

  /// Right after placing an order.
  static const String placed = '/checkout/placed';

  static final List<RouteBase> routes = [
    GoRoute(path: checkout, builder: (_, _) => const CheckoutPage()),
    GoRoute(path: placed, builder: (_, _) => const OrderPlacedPage()),
  ];
}

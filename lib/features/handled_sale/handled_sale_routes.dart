import 'package:go_router/go_router.dart';

import 'presentation/pages/buy_page.dart';
import 'presentation/pages/earnings_page.dart';
import 'presentation/pages/sale_page.dart';
import 'presentation/pages/sales_page.dart';

/// Waraqah-handled sales. Everything under [sales] is signed-in only (see
/// `RouteAccess.signedInOnly`).
abstract final class HandledSaleRoutes {
  static const String sales = '/sales';
  static const String earnings = '/sales/earnings';

  /// Paying for a Listing through Waraqah.
  static String buyFor(String listingId) => '/sales/buy/$listingId';

  /// One sale, from either side.
  static String saleFor(String id) => '/sales/$id';

  static final List<RouteBase> routes = [
    GoRoute(path: sales, builder: (_, _) => const SalesPage()),
    GoRoute(path: earnings, builder: (_, _) => const EarningsPage()),
    GoRoute(
      path: '/sales/buy/:listingId',
      builder: (_, state) =>
          BuyPage(listingId: state.pathParameters['listingId'] ?? ''),
    ),
    GoRoute(
      path: '/sales/:id',
      builder: (_, state) => SalePage(id: state.pathParameters['id'] ?? ''),
    ),
  ];
}

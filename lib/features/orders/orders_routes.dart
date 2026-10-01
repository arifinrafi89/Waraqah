import 'package:go_router/go_router.dart';

import 'presentation/pages/invoice_page.dart';
import 'presentation/pages/order_details_page.dart';
import 'presentation/pages/orders_page.dart';
import 'presentation/pages/return_policy_page.dart';

abstract final class OrdersRoutes {
  /// Signed-in only (see `RouteAccess.signedInOnly`), like everything under it.
  static const String orders = '/orders';
  static const String details = '/orders/:number';

  /// Anyone can read it, before buying too.
  static const String returnPolicy = '/return-policy';

  /// One order's page, e.g. `/orders/WQ-100231`.
  static String detailsFor(String number) => '$orders/$number';

  /// The order's invoice, e.g. `/orders/WQ-100231/invoice`.
  static String invoiceFor(String number) => '$orders/$number/invoice';

  static final List<RouteBase> routes = [
    GoRoute(path: orders, builder: (_, _) => const OrdersPage()),
    GoRoute(
      path: details,
      builder: (_, state) =>
          OrderDetailsPage(number: state.pathParameters['number']!),
    ),
    GoRoute(
      path: '$details/invoice',
      builder: (_, state) =>
          InvoicePage(number: state.pathParameters['number']!),
    ),
    GoRoute(path: returnPolicy, builder: (_, _) => const ReturnPolicyPage()),
  ];
}

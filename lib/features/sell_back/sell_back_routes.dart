import 'package:go_router/go_router.dart';

import 'presentation/pages/my_sell_backs_page.dart';
import 'presentation/pages/sell_back_page.dart';

/// Sell Back to Waraqah. Everything under [sellBack] is signed-in only
/// (see `RouteAccess.signedInOnly`).
abstract final class SellBackRoutes {
  static const String sellBack = '/sell-back';
  static const String mine = '/sell-back/mine';

  /// The quote, starting from a catalog Book (scanned, or just finished).
  static String sellBackFor(String bookId) =>
      Uri(path: sellBack, queryParameters: {'bookId': bookId}).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: sellBack,
      builder: (_, state) =>
          SellBackPage(bookId: state.uri.queryParameters['bookId']),
    ),
    GoRoute(path: mine, builder: (_, _) => const MySellBacksPage()),
  ];
}

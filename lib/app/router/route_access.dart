import '../../features/admin/admin_routes.dart';
import '../../features/admin/domain/entities/admin_section.dart';
import '../../features/alerts/alerts_routes.dart';
import '../../features/auth/auth_routes.dart';
import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/domain/entities/user_role.dart';
import '../../features/bites/bites_routes.dart';
import '../../features/book_request/book_request_routes.dart';
import '../../features/checkout/checkout_routes.dart';
import '../../features/handled_sale/handled_sale_routes.dart';
import '../../features/home/home_routes.dart';
import '../../features/inbox/inbox_routes.dart';
import '../../features/loyalty/loyalty_routes.dart';
import '../../features/notifications/notifications_routes.dart';
import '../../features/orders/orders_routes.dart';
import '../../features/profile/profile_routes.dart';
import '../../features/report/report_routes.dart';
import '../../features/sell_back/sell_back_routes.dart';
import '../../features/wallet/wallet_routes.dart';

/// Which pages need a signed-in user or a staff account, and where to send
/// someone who isn't allowed in.
///
/// Kept as a plain function of (location, user) so it is easy to test.
abstract final class RouteAccess {
  /// Staff only. The whole Admin area lives under [AdminRoutes.admin].
  static const List<String> staffOnly = [AdminRoutes.admin];

  /// Any signed-in user. Add pages here as they are built (checkout, orders…).
  static const List<String> signedInOnly = [
    CheckoutRoutes.checkout,
    OrdersRoutes.orders,
    AlertsRoutes.alerts,
    NotificationsRoutes.center,
    LoyaltyRoutes.points,
    WalletRoutes.wallet,
    InboxRoutes.inbox,
    ReportRoutes.blocked,
    BookRequestRoutes.requests,
    HandledSaleRoutes.sales,
    SellBackRoutes.sellBack,
    ProfileRoutes.edit,
    ProfileRoutes.addresses,
    ProfileRoutes.settings,
    BitesRoutes.compose,
  ];

  /// Where to redirect [location] for [user], or `null` to let it open.
  static String? redirect(String location, AppUser? user) {
    if (location == AuthRoutes.login && user != null) return HomeRoutes.home;
    if (_matches(location, staffOnly) && !(user?.role.isStaff ?? false)) {
      return user == null ? AuthRoutes.login : HomeRoutes.home;
    }
    // Staff who can't open this Admin section go back to the hub.
    final role = user?.role;
    if (role != null &&
        AdminSection.values.any(
          (s) =>
              _matches(location, [AdminRoutes.section(s)]) && !s.canOpen(role),
        )) {
      return AdminRoutes.admin;
    }
    if (_matches(location, signedInOnly) && user == null) {
      return AuthRoutes.login;
    }
    return null;
  }

  static bool _matches(String location, List<String> paths) =>
      paths.any((path) => location == path || location.startsWith('$path/'));
}

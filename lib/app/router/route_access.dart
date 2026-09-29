import '../../features/auth/auth_routes.dart';
import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/domain/entities/user_role.dart';
import '../../features/home/home_routes.dart';

/// Which pages need a signed-in user or a staff account, and where to send
/// someone who isn't allowed in.
///
/// Kept as a plain function of (location, user) so it is easy to test.
abstract final class RouteAccess {
  /// The admin area. Everything under this path is staff only.
  static const String admin = '/admin';

  /// Staff only. The whole admin area lives under [admin].
  static const List<String> staffOnly = [admin];

  /// Any signed-in user. Add pages here as they are built (checkout, orders…).
  static const List<String> signedInOnly = [];

  /// Where to redirect [location] for [user], or `null` to let it open.
  static String? redirect(String location, AppUser? user) {
    if (location == AuthRoutes.login && user != null) return HomeRoutes.home;
    if (_matches(location, staffOnly) && !(user?.role.isStaff ?? false)) {
      return user == null ? AuthRoutes.login : HomeRoutes.home;
    }
    if (_matches(location, signedInOnly) && user == null) {
      return AuthRoutes.login;
    }
    return null;
  }

  static bool _matches(String location, List<String> paths) =>
      paths.any((path) => location == path || location.startsWith('$path/'));
}

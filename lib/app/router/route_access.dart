import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/domain/entities/user_role.dart';
import 'app_routes.dart';

/// Which pages need a signed-in user or a staff account, and where to send
/// someone who isn't allowed in.
///
/// Kept as a plain function of (location, user) so it is easy to test.
abstract final class RouteAccess {
  /// Staff only. The whole admin area lives under this path.
  static const List<String> staffOnly = [AppRoutes.admin];

  /// Any signed-in user. Add pages here as they are built (checkout, orders…).
  static const List<String> signedInOnly = [];

  /// Where to redirect [location] for [user], or `null` to let it open.
  static String? redirect(String location, AppUser? user) {
    if (location == AppRoutes.login && user != null) return AppRoutes.home;
    if (_matches(location, staffOnly) && !(user?.role.isStaff ?? false)) {
      return user == null ? AppRoutes.login : AppRoutes.home;
    }
    if (_matches(location, signedInOnly) && user == null) {
      return AppRoutes.login;
    }
    return null;
  }

  static bool _matches(String location, List<String> paths) =>
      paths.any((path) => location == path || location.startsWith('$path/'));
}

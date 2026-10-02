import 'package:go_router/go_router.dart';

import 'presentation/pages/edit_profile_page.dart';
import 'presentation/pages/profile_page.dart';
import 'presentation/pages/profile_preferences_page.dart';
import 'presentation/pages/saved_addresses_page.dart';

abstract final class ProfileRoutes {
  static const String profile = '/profile';

  /// Name, phone and photo. Signed-in only, like the pages below.
  static const String edit = '/profile/edit';

  /// Saved addresses; checkout uses the same ones.
  static const String addresses = '/profile/addresses';

  /// [addresses] with the new-address editor already open.
  static const String addressesAdd = '$addresses?add=1';

  /// Notifications, privacy and delete account.
  static const String settings = '/profile/settings';

  /// Opened over the tabs.
  static final List<RouteBase> routes = [
    GoRoute(path: edit, builder: (_, _) => const EditProfilePage()),
    GoRoute(path: addresses, builder: (_, _) => const SavedAddressesPage()),
    GoRoute(path: settings, builder: (_, _) => const ProfilePreferencesPage()),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: profile, builder: (_, _) => const ProfilePage())],
  );
}

import 'package:go_router/go_router.dart';

import 'presentation/pages/profile_page.dart';

abstract final class ProfileRoutes {
  static const String profile = '/profile';

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: profile, builder: (_, _) => const ProfilePage())],
  );
}

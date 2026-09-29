import 'package:go_router/go_router.dart';

import 'presentation/pages/home_page.dart';

abstract final class HomeRoutes {
  static const String home = '/home';

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: home, builder: (_, _) => const HomePage())],
  );
}

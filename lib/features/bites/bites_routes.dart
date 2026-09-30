import 'package:go_router/go_router.dart';

import 'presentation/pages/bites_page.dart';

abstract final class BitesRoutes {
  static const String bites = '/bites';

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: bites, builder: (_, _) => const BitesPage())],
  );
}
